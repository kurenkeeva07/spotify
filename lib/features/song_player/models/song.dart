import 'dart:ui';

class SongModel {
  Duration? duration;
  String trackId;
  String? artistName;
  String? songName;
  String? songImage;
  String? artistImage;
  Color? songColor;

  SongModel({
  this.duration,
  required this.trackId,
  this.artistName,
  this.songName,
  this.songImage,
  this.artistImage,
  this.songColor
  }
  );
}