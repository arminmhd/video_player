import 'package:movie_stream_app/features/home/domain/entities/movie_entity.dart';

enum SearchStatus { initial, loading, loaded, error }

class SearchState {
  final SearchStatus status;
  final String query;

  final List<MovieEntity> allResults;
  final List<MovieEntity> movieResults;
  final List<MovieEntity> tvResults;

  final String? message;

  const SearchState({
    required this.status,
    required this.query,
    required this.allResults,
    required this.movieResults,
    required this.tvResults,
    this.message,
  });

  factory SearchState.initial() {
    return const SearchState(
      status: SearchStatus.initial,
      query: '',
      allResults: [],
      movieResults: [],
      tvResults: [],
    );
  }

  SearchState copyWith({
    SearchStatus? status,
    String? query,
    List<MovieEntity>? allResults,
    List<MovieEntity>? movieResults,
    List<MovieEntity>? tvResults,
    String? message,
  }) {
    return SearchState(
      status: status ?? this.status,
      query: query ?? this.query,
      allResults: allResults ?? this.allResults,
      movieResults: movieResults ?? this.movieResults,
      tvResults: tvResults ?? this.tvResults,
      message: message ?? this.message,
    );
  }
}
