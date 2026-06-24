import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_stream_app/app/di/injection.dart';
import 'package:movie_stream_app/features/movie_detail/presentation/bloc/movie_detail_bloc.dart';
import 'package:movie_stream_app/features/movie_detail/presentation/bloc/movie_detail_event.dart';
import 'package:movie_stream_app/features/movie_detail/presentation/bloc/movie_detail_state.dart';
import 'package:movie_stream_app/features/movie_detail/presentation/pages/movie_detail_view.dart';

class MovieDetailPage extends StatelessWidget {
  final int movieId;

  const MovieDetailPage({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<MovieDetailBloc>()..add(MovieDetailRequested(movieId)),
      child: BlocBuilder<MovieDetailBloc, MovieDetailState>(
        builder: (context, state) {
          if (state.status == MovieDetailStatus.loading ||
              state.status == MovieDetailStatus.initial) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          if (state.status == MovieDetailStatus.error) {
            return Scaffold(
              body: Center(
                child: Text(state.message ?? 'Something went wrong'),
              ),
            );
          }

          if (state.movie == null) {
            return const Scaffold(body: Center(child: Text('Movie not found')));
          }

          return MovieDetailView(movie: state.movie!);
        },
      ),
    );
  }
}
