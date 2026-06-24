import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_stream_app/features/home/domain/entities/movie_entity.dart';

class HomeTrendingMovieCard extends StatelessWidget {
  final MovieEntity movie;
  final VoidCallback onTap;

  const HomeTrendingMovieCard({
    super.key,
    required this.movie,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 110.w,
        margin: EdgeInsets.only(right: 10.w),

        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r)),
        child: Column(
          children: [
            Image.network(
              "https://image.tmdb.org/t/p/w500${movie.posterPath}",
              fit: BoxFit.cover,
            ),

            SizedBox(height: 6.h),
            Text(movie.title, maxLines: 1, overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
    );
  }
}
