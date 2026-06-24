import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_stream_app/features/home/domain/usecases/get_featured_movies_use_case.dart';
import 'package:movie_stream_app/features/home/domain/usecases/get_popular_movies_use_case.dart';
import 'package:movie_stream_app/features/home/domain/usecases/get_trending_movies_use_case.dart';
import 'package:movie_stream_app/features/home/presentation/bloc/home_event.dart';
import 'package:movie_stream_app/features/home/presentation/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetFeaturedMoviesUseCase getFeaturedMovies;
  final GetTrendingMoviesUseCase getTrendingMovies;
  final GetPopularMoviesUseCase getPopularMovies;

  HomeBloc({
    required this.getFeaturedMovies,
    required this.getTrendingMovies,
    required this.getPopularMovies,
  }) : super(HomeState.initial()) {
    on<HomeStarted>(_onStarted);
  }

  Future<void> _onStarted(HomeStarted event, Emitter<HomeState> emit) async {
    emit(state.copyWith(status: HomeStatus.loading));
    try {
      final featured = await getFeaturedMovies();
      final trending = await getTrendingMovies();
      final popular = await getPopularMovies();

      emit(
        state.copyWith(
          status: HomeStatus.loaded,
          featuredMovies: featured,
          trendingMovies: trending,
          popularMovies: popular,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: HomeStatus.error, message: e.toString()));
    }
  }
}
