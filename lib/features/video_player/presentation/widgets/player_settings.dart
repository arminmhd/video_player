import 'package:flutter/material.dart';
import 'player_actions_tile.dart';

class PlayerSettings extends StatelessWidget {
  final String quality;
  final double playbackSpeed;

  final VoidCallback onQualityTap;
  final VoidCallback onSpeedTap;
  final VoidCallback onWatchlistTap;

  const PlayerSettings({
    super.key,
    required this.quality,
    required this.playbackSpeed,
    required this.onQualityTap,
    required this.onSpeedTap,
    required this.onWatchlistTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).cardColor,
      ),
      child: Column(
        children: [
          PlayerActionsTile(
            icon: Icons.high_quality,
            title: 'Quality',
            value: quality,
            onTap: onQualityTap,
          ),

          const Divider(),

          PlayerActionsTile(
            icon: Icons.speed,
            title: 'Playback Speed',
            value: '${playbackSpeed}x',
            onTap: onSpeedTap,
          ),

          const Divider(),

          PlayerActionsTile(
            icon: Icons.bookmark_add_outlined,
            title: 'Add To Watchlist',
            onTap: onWatchlistTap,
          ),
        ],
      ),
    );
  }
}
