import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_stream_app/features/search/domain/usecases/search_movie_use_case.dart';
import 'package:movie_stream_app/features/search/domain/usecases/search_tv_shows_use_case.dart';
import 'package:movie_stream_app/features/search/presentation/bloc/search_evet.dart';
import 'package:movie_stream_app/features/search/presentation/bloc/search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchMovieUseCase searchMovies;
  final SearchTvShowsUseCase searchTv;

  SearchBloc({required this.searchMovies, required this.searchTv})
    : super(SearchState.initial()) {
    on<SearchQueryChanged>(_onQueryChanged);
  }

  Future<void> _onQueryChanged(
    SearchQueryChanged event,
    Emitter<SearchState> emit,
  ) async {
    final query = event.query.trim();

    if (query.isEmpty) {
      emit(SearchState.initial());
      return;
    }

    emit(state.copyWith(status: SearchStatus.loading));

    try {
      final movies = await searchMovies(query);
      final tvs = await searchTv(query);

      emit(
        state.copyWith(
          status: SearchStatus.loaded,
          query: query,
          movieResults: movies,
          tvResults: tvs,
          allResults: [...movies, ...tvs],
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: SearchStatus.error, message: e.toString()));
    }
  }
}
