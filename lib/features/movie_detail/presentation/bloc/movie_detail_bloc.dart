import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_stream_app/features/movie_detail/domain/usecases/get_movie_detail_use_case.dart';
import 'package:movie_stream_app/features/movie_detail/presentation/bloc/movie_detail_event.dart';
import 'package:movie_stream_app/features/movie_detail/presentation/bloc/movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMovieDetailUseCase getMovieDetail;

  MovieDetailBloc({required this.getMovieDetail})
    : super(MovieDetailState.initial()) {
    on<MovieDetailRequested>(_onMovieDetailRequested);
  }

  Future _onMovieDetailRequested(
    MovieDetailRequested event,
    Emitter<MovieDetailState> emit,
  ) async {
    emit(state.copyWith(status: MovieDetailStatus.loading));

    try {
      final movie = await getMovieDetail(event.movieId);
      emit(state.copyWith(status: MovieDetailStatus.loaded, movie: movie));
    } catch (e) {
      emit(
        state.copyWith(status: MovieDetailStatus.error, message: e.toString()),
      );
    }
  }
}
