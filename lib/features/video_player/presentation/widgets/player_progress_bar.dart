import 'package:flutter/material.dart';

class PlayerProgressBar extends StatelessWidget {
  final double progress;
  final String currentTime;
  final String totalTime;
  final ValueChanged<double> onSeek;

  const PlayerProgressBar({
    super.key,
    required this.progress,
    required this.currentTime,
    required this.totalTime,
    required this.onSeek,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(value: progress.clamp(0.0, 1.0), onChanged: onSeek),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(currentTime), Text(totalTime)],
        ),
      ],
    );
  }
}
