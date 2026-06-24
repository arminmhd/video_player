import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_stream_app/features/movie_detail/domain/entities/movie_detail_entity.dart';

class MovieHeader extends StatelessWidget {
  final MovieDetailEntity movie;

  const MovieHeader({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 350.h,
      pinned: true,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back),
      ),
      flexibleSpace: FlexibleSpaceBar(
        title: Text(movie.title, maxLines: 1, overflow: TextOverflow.ellipsis),
        background: Image.network(
          'https://image.tmdb.org/t/p/w780${movie.backdropPath}',
          fit: BoxFit.cover,
          errorBuilder: (_, _, _) {
            return Container(color: Colors.black26);
          },
        ),
      ),
    );
  }
}
