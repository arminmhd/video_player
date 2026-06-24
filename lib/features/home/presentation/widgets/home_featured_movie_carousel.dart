import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_stream_app/core/theme/app_colors.dart';
import 'package:movie_stream_app/core/theme/app_text_styles.dart';
import 'package:movie_stream_app/features/home/domain/entities/movie_entity.dart';

class HomeFeaturedMovieCarousel extends StatelessWidget {
  final List<MovieEntity> movies;
  final void Function(int id) onMovieTap;
  const HomeFeaturedMovieCarousel({
    super.key,
    required this.movies,
    required this.onMovieTap,
  });

  @override
  Widget build(BuildContext context) {
    final limitedMovies = movies.take(8).toList();

    return SizedBox(
      height: 240.h,
      child: PageView.builder(
        itemCount: limitedMovies.length,
        controller: PageController(viewportFraction: 1),
        itemBuilder: (context, index) {
          final movie = limitedMovies[index];
          return _FeaturedCard(movie: movie, onTap: () => onMovieTap(movie.id));
        },
      ),
    );
  }
}

class _FeaturedCard extends StatelessWidget {
  final MovieEntity movie;
  final VoidCallback onTap;

  const _FeaturedCard({required this.movie, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(18.r),
              child: Image.network(
                "https://image.tmdb.org/t/p/w500${movie.backdropPath}",
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18.r),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.7),
                    Colors.transparent,
                  ],
                ),
              ),
            ),

            Positioned(
              left: 16.w,
              bottom: 16.h,
              right: 16.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.titleLarge,
                  ),

                  SizedBox(height: 10.h),

                  ElevatedButton.icon(
                    onPressed: onTap,
                    icon: const Icon(Icons.play_arrow),
                    label: const Text("Watch"),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
