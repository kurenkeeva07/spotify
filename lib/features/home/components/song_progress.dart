import 'package:audio_service/audio_service.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import '../services/song_handler.dart';

class SongProgress extends StatelessWidget {
  final Duration totalDuration;
  final SongHandler songHandler;

  const SongProgress({
    super.key,
    required this.totalDuration,
    required this.songHandler,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Duration>(
      stream: AudioService.position,
      builder: (context, positionSnapshot) {
        Duration? position = positionSnapshot.data;

        return ProgressBar(
          progress: position ?? Duration.zero,
          total: totalDuration,
          onSeek: (position) {
            songHandler.seek(position);
          },
          barHeight: 5,
          thumbRadius: 2.5,
          thumbGlowRadius: 5,
          timeLabelLocation: TimeLabelLocation.below,
          timeLabelPadding: 10,
        );
      },
    );
  }
}
