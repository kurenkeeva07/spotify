import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import '../services/get_songs.dart';
import '../services/song_handler.dart';

class SongsProvider extends ChangeNotifier {
  List<MediaItem> _songs = [];
  List<MediaItem> get songs => _songs;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

 Future<void> loadSongs(SongHandler songHandler) async {
    try {
      _songs = await getSongs();

      await songHandler.initSongs(songs: _songs);

      _isLoading = false;

      notifyListeners();
    } catch (e) {
      debugPrint('Error loading songs: $e');

    }
  }
}
