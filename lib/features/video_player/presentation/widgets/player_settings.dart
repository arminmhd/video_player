import 'package:flutter/material.dart';
import 'player_actions_tile.dart';

class PlayerSettings extends StatelessWidget {
  final VoidCallback onQualityTap;
  final VoidCallback onCaptionTap;
  final VoidCallback onSpeedTap;
  final VoidCallback onWatchlistTap;

  const PlayerSettings({
    super.key,
    required this.onQualityTap,
    required this.onCaptionTap,
    required this.onSpeedTap,
    required this.onWatchlistTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        PlayerActionsTile(
          icon: Icons.high_quality,
          title: 'Quality',
          onTap: onQualityTap,
        ),
        PlayerActionsTile(
          icon: Icons.closed_caption,
          title: 'Captions',
          onTap: onCaptionTap,
        ),
        PlayerActionsTile(
          icon: Icons.speed,
          title: 'Playback Speed',
          onTap: onSpeedTap,
        ),
        PlayerActionsTile(
          icon: Icons.bookmark_add_outlined,
          title: 'Watchlist',
          onTap: onWatchlistTap,
        ),
      ],
    );
  }
}
