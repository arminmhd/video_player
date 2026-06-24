import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_stream_app/core/theme/app_text_styles.dart';
import 'package:movie_stream_app/features/home/domain/entities/movie_entity.dart';
import 'package:movie_stream_app/features/home/presentation/widgets/home_trending_movie_card.dart';

class TrendingSection extends StatelessWidget {
  final List<MovieEntity> movies;
  final void Function(int id) onMovieTap;
  const TrendingSection({
    super.key,
    required this.movies,
    required this.onMovieTap,
  });

  @override
  Widget build(BuildContext context) {
    final limitedMovies = movies.take(12).toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Trending Now", style: AppTextStyles.bodyLarge),
            TextButton(onPressed: () {}, child: Text('See all')),
          ],
        ),

        SizedBox(height: 12.h),

        // LIST
        SizedBox(
          height: 230.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: limitedMovies.length,
            itemBuilder: (context, index) {
              final movie = limitedMovies[index];
              return HomeTrendingMovieCard(
                movie: movie,
                onTap: () => onMovieTap(movie.id),
              );
            },
          ),
        ),
      ],
    );
  }
}
