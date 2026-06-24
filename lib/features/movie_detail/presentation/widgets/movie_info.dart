import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_stream_app/core/theme/app_colors.dart';
import 'package:movie_stream_app/core/theme/app_text_styles.dart';
import 'package:movie_stream_app/features/movie_detail/domain/entities/movie_detail_entity.dart';

class MovieInfo extends StatelessWidget {
  final MovieDetailEntity movie;

  const MovieInfo({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final year = movie.releaseDate.split('-').first;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(movie.title, style: Theme.of(context).textTheme.headlineSmall),

        SizedBox(height: 8.h),

        Text('$year • ${formatRunTime(movie.runtime)}'),

        SizedBox(height: 8.h),

        Row(
          children: [
            const Icon(Icons.star, color: Colors.amber),
            SizedBox(width: 4.w),
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.r),
                color: AppColors.surface,
              ),

              child: Text('${movie.voteAverage.toStringAsFixed(1)}/10'),
            ),
            SizedBox(width: 4.w),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.r),
                color: Colors.amber,
              ),
              padding: EdgeInsets.all(2),

              child: Text(
                'IMDb',
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.surface,
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: 12.h),

        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: movie.genres
              .map(
                (genre) => Chip(
                  label: Text(
                    genre,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  side: BorderSide.none,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }

  String formatRunTime(int minutes) {
    final hours = minutes ~/ 60;
    final remainingMinutes = minutes % 60;
    return '$hours h ${remainingMinutes}m';
  }
}
