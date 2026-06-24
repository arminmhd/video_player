import 'package:equatable/equatable.dart';
import 'package:movie_stream_app/features/home/domain/entities/movie_entity.dart';

enum HomeStatus { initial, loading, loaded, error }

class HomeState extends Equatable {
  final HomeStatus status;

  final List<MovieEntity> featuredMovies;
  final List<MovieEntity> trendingMovies;
  final List<MovieEntity> popularMovies;

  final String? message;

  const HomeState({
    required this.status,
    required this.featuredMovies,
    required this.trendingMovies,
    required this.popularMovies,
    this.message,
  });

  factory HomeState.initial() {
    return const HomeState(
      status: HomeStatus.initial,
      featuredMovies: [],
      trendingMovies: [],
      popularMovies: [],
    );
  }

  HomeState copyWith({
    HomeStatus? status,
    List<MovieEntity>? featuredMovies,
    List<MovieEntity>? trendingMovies,
    List<MovieEntity>? popularMovies,
    String? message,
  }) {
    return HomeState(
      status: status ?? this.status,
      featuredMovies: featuredMovies ?? this.featuredMovies,
      trendingMovies: trendingMovies ?? this.trendingMovies,
      popularMovies: popularMovies ?? this.popularMovies,
      message: message,
    );
  }

  @override
  List<Object?> get props => [
    status,
    featuredMovies,
    trendingMovies,
    popularMovies,
    message,
  ];
}
