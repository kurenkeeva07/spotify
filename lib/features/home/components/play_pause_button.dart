import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';

import '../services/song_handler.dart';

class PlayPauseButton extends StatelessWidget {
  final SongHandler songHandler;

  final double size;

  const PlayPauseButton({
    super.key,
    required this.size,
    required this.songHandler,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PlaybackState>(
      stream: songHandler.playbackState.stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          bool playing = snapshot.data!.playing;

          return IconButton(
            onPressed: () {
              if (playing) {
                songHandler.pause();
              } else {
                songHandler.play();
              }
            },
            icon: playing
                ? Icon(Icons.pause_rounded, size: size)
                : Icon(Icons.play_arrow_rounded, size: size),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
