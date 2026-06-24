import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_stream_app/core/theme/app_colors.dart';
import 'package:movie_stream_app/core/theme/app_text_styles.dart';

class MovieActions extends StatelessWidget {
  final VoidCallback onPlayPressed;
  final VoidCallback onWatchListPressed;

  const MovieActions({
    super.key,
    required this.onPlayPressed,
    required this.onWatchListPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: FilledButton.icon(
            onPressed: onPlayPressed,
            icon: Icon(
              Icons.play_arrow,
              size: 30.w,
              color: AppColors.textPrimary,
            ),
            label: Text('Play', style: AppTextStyles.titleMedium),
          ),
        ),

        const SizedBox(height: 12),

        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: onWatchListPressed,
            icon: const Icon(Icons.bookmark_add),
            label: const Text('Add to Watchlist'),
          ),
        ),
      ],
    );
  }
}
