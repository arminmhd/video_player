import 'package:movie_stream_app/features/movie_detail/domain/entities/movie_detail_entity.dart';

enum MovieDetailStatus { initial, loading, loaded, error }

class MovieDetailState {
  final MovieDetailStatus status;
  final MovieDetailEntity? movie;
  final String? message;

  const MovieDetailState({required this.status, this.movie, this.message});

  factory MovieDetailState.initial() {
    return const MovieDetailState(status: MovieDetailStatus.initial);
  }

  MovieDetailState copyWith({
    MovieDetailStatus? status,
    MovieDetailEntity? movie,
    String? message,
  }) {
    return MovieDetailState(
      status: status ?? this.status,
      movie: movie ?? this.movie,
      message: message,
    );
  }
}
