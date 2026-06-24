import 'package:flutter/material.dart';

class PlayerVolumeSlider extends StatelessWidget {
  final double value;
  final ValueChanged<double> onChanged;

  const PlayerVolumeSlider({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.volume_up),
        Expanded(
          child: Slider(value: value.clamp(0.0, 1.0), onChanged: onChanged),
        ),
      ],
    );
  }
}
