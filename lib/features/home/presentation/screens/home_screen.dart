import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_spotify/features/home/presentation/screens/search_page.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import '../../../../common/widgets/appbar/basic_appbar.dart';
import '../../../../core/configs/assets/app_images.dart';
import '../../../../core/configs/assets/app_vectors.dart';
import '../../components/player_deck.dart';
import '../../components/songs_list.dart';
import '../../notifier/songs_provider.dart';
import '../../services/song_handler.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.songHandler});
  final SongHandler songHandler;


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  final AutoScrollController _autoScrollController = AutoScrollController();

  void _scrollTo(int index) {
    _autoScrollController.scrollToIndex(
      index,
      preferPosition: AutoScrollPosition.middle,
      duration: const Duration(milliseconds: 800),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: Theme.of(context).colorScheme.primary,
        systemNavigationBarIconBrightness:
        Theme.of(context).brightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark,
      ),
      child: Consumer<SongsProvider>(
        builder: (context, songsProvider, _) {
          return Scaffold(
              appBar: BasicAppbar(
                hideBack: true,
              title: SvgPicture.asset(
              AppVectors.logo,
              height: 40,
              width: 40,
              ),
                action:
                IconButton(
                  onPressed: () => Get.to(
                        () => SearchPage(songHandler: widget.songHandler),
                    duration: const Duration(milliseconds: 700),
                    transition: Transition.rightToLeft,
                  ),
                  icon: const Icon(
                    Icons.search_rounded,
                  ),
                ),
              ),
              body: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _homeTopCard(),
                        songsProvider.isLoading
                            ? _buildLoadingIndicator()
                            : _buildSongsList(songsProvider),
                      ]
                  )
              )
          );
        },
      ),
    );
  }

  Widget _homeTopCard() {
    return Center(
      child: SizedBox(
        height: 140,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SvgPicture.asset(
                  AppVectors.homeTopCard
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(
                    right: 60
                ),
                child: Image.asset(
                    AppImages.homeArtist
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

   Widget _buildLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(
        strokeCap: StrokeCap.round,
      ),
    );
  }

   Widget _buildSongsList(SongsProvider songsProvider) {
    return Stack(
      children: [
        SongsList(
          songHandler: widget.songHandler,
          songs: songsProvider.songs,
          autoScrollController: _autoScrollController,
        ),
        _buildPlayerDeck(),
      ],
    );
  }

  Widget _buildPlayerDeck() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        PlayerDeck(
          songHandler: widget.songHandler,
          isLast: false,
          onTap: _scrollTo,
        ),
      ],
    );
  }
}