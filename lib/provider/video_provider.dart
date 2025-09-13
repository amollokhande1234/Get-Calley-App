import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoProvider extends ChangeNotifier {
  late VideoPlayerController controller;
  bool isInitialized = false;
  bool isPlaying = false;

  void initialize(String url) async {
    controller = await VideoPlayerController.network(
        'https://media.istockphoto.com/id/1046965704/video/programming-source-code-abstract-background.mp4?s=mp4-640x640-is&k=20&c=E7PGx6e2DxpcNqp2SaN6Q9JaJ4A5OdBTp7ldtgLX_RE=',
      )
      ..initialize().then((_) {
        isInitialized = true;
        notifyListeners();
      });
  }

  void togglePlayPause() {
    if (!isInitialized) return;

    if (controller.value.isPlaying) {
      controller.pause();
      isPlaying = false;
    } else {
      controller.play();
      isPlaying = true;
    }
    notifyListeners();
  }

  void disposeController() {
    controller.dispose();
  }
}
