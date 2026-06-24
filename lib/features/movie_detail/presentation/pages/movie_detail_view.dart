import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_stream_app/app/router/route_names.dart';
import 'package:movie_stream_app/features/movie_detail/domain/entities/movie_detail_entity.dart';
import 'package:movie_stream_app/features/movie_detail/presentation/widgets/movie_actions.dart';
import 'package:movie_stream_app/features/movie_detail/presentation/widgets/movie_header.dart';
import 'package:movie_stream_app/features/movie_detail/presentation/widgets/movie_info.dart';

class MovieDetailView extends StatelessWidget {
  final MovieDetailEntity movie;

  const MovieDetailView({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          MovieHeader(movie: movie),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MovieInfo(movie: movie),

                  SizedBox(height: 24.h),

                  MovieActions(
                    onPlayPressed: () {
                      context.push(
                        AppRoutes.player,
                        extra:
                            'https://test-streams.mux.dev/x36xhzz/x36xhzz.m3u8',
                      );
                    },
                    onWatchListPressed: () {},
                  ),

                  SizedBox(height: 24.h),

                  Text(
                    'Overview',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),

                  const SizedBox(height: 12),

                  Text(movie.overview),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
