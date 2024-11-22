import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../components/player_deck.dart';
import '../../components/song_item.dart';
import '../../notifier/songs_provider.dart';
import '../../services/song_handler.dart';
import '../../utils/formatted_title.dart';

class SearchPage extends StatefulWidget {
  final SongHandler songHandler;
  const SearchPage({super.key, required this.songHandler});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final List<MediaItem> _result = [];
  final TextEditingController _textEditingController = TextEditingController();

  void _search({required String value, required List<MediaItem> songs}) {
    for (var song in songs) {
      bool containsTitle = song.title
          .toLowerCase()
          .replaceAll(" ", "")
          .contains(value.toLowerCase().replaceAll(" ", ""));
      bool containsArtist = song.artist!
          .toLowerCase()
          .replaceAll(" ", "")
          .contains(value.toLowerCase().replaceAll(" ", ""));

      if (containsTitle || containsArtist) {
        bool contains = _result.any((element) => element.id == song.id);
        if (!contains) {
          setState(() {
            _result.add(song);
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SongsProvider>(
      builder: (context, ref, child) {
        List<MediaItem> songs = ref.songs;
        return Scaffold(
          appBar: AppBar(
            title: TextField(
              controller: _textEditingController,
              autofocus: true,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Search",
              ),
              onChanged: (value) {
                setState(() {
                  _result.clear();
                });
                _search(value: value, songs: songs);
              },
            ),
            actions: [
              if (_textEditingController.text.trim().isNotEmpty)
                IconButton(
                  onPressed: () {
                    setState(() {
                      _textEditingController.clear();
                      _result.clear();
                    });
                  },
                  icon: const Icon(Icons.close),
                ),
            ],
          ),
          body: _buildBody(ref),
        );
      },
    );
  }

  Widget _buildBody(SongsProvider ref) {
    if (ref.isLoading) {
      return _buildLoadingIndicator();
    } else if (ref.songs.isEmpty) {
      return const Center(
        child: Text("No songs!!!"),
      );
    } else {
      return _buildSongList(ref.songs);
    }
  }


  Widget _buildLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(
        strokeCap: StrokeCap.round,
      ),
    );
  }

  Widget _buildSongList(List<MediaItem> songs) {
    return Stack(
      children: [
        ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: _result.isNotEmpty ? _result.length : songs.length,
          itemBuilder: (context, index) {
            MediaItem song = _result.isNotEmpty ? _result[index] : songs[index];
            int songIndex = songs.indexOf(song);

            return StreamBuilder<MediaItem?>(
              stream: widget.songHandler.mediaItem.stream,
              builder: (context, snapshot) {
                MediaItem? playingSong = snapshot.data;
                return index ==
                        (_result.isNotEmpty
                            ? _result.length - 1
                            : songs.length - 1)
                    ? _buildLastSongItem(song, playingSong, songs.indexOf(song))
                    : _buildRegularSongItem(song, playingSong, songIndex);
              },
            );
          },
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            PlayerDeck(
              songHandler: widget.songHandler,
              isLast: false,
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLastSongItem(MediaItem song, MediaItem? playingSong, int index) {
    return Column(
      children: [
        SongItem(
          art: song.artUri!,
          searchedWord: _textEditingController.text.trim(),
          id: int.parse(song.displayDescription!),
          isPlaying: song == playingSong,
          title: formattedTitle(song.title),
          artist: song.artist,
          onSongTap: () async {
            await widget.songHandler.skipToQueueItem(index);
          },
        ),
        PlayerDeck(
          songHandler: widget.songHandler,
          isLast: true,
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildRegularSongItem(
      MediaItem song, MediaItem? playingSong, int songIndex) {
    return SongItem(
      art: song.artUri!,
      searchedWord: _textEditingController.text.trim(),
      id: int.parse(song.displayDescription!),
      isPlaying: song == playingSong,
      title: formattedTitle(song.title),
      artist: song.artist,
      onSongTap: () async {
         await widget.songHandler.skipToQueueItem(songIndex);
      },
    );
  }
}
