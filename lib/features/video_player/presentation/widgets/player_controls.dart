import 'package:flutter/material.dart';

class PlayerControls extends StatelessWidget {
  final bool isPlaying;

  final VoidCallback onPlayPause;
  final VoidCallback onForward10;
  final VoidCallback onBackward10;
  final VoidCallback onFullScreen;
  final VoidCallback onVolumePressed;

  const PlayerControls({
    super.key,
    required this.isPlaying,
    required this.onPlayPause,
    required this.onForward10,
    required this.onBackward10,
    required this.onFullScreen,
    required this.onVolumePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: onVolumePressed,
          icon: const Icon(Icons.volume_up),
        ),

        IconButton(onPressed: onBackward10, icon: const Icon(Icons.replay_10)),

        IconButton(
          onPressed: onPlayPause,
          icon: Icon(
            isPlaying ? Icons.pause_circle_filled : Icons.play_circle_filled,
            size: 48,
          ),
        ),

        IconButton(onPressed: onForward10, icon: const Icon(Icons.forward_10)),

        IconButton(onPressed: onFullScreen, icon: const Icon(Icons.fullscreen)),
      ],
    );
  }
}
