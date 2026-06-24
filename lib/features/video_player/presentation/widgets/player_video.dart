import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PlayerVideo extends StatelessWidget {
  final VideoPlayerController controller;

  const PlayerVideo({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }

    return AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: VideoPlayer(controller),
    );
  }
}
