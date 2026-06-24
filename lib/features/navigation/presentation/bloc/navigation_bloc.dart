import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_stream_app/features/navigation/presentation/bloc/navigation_event.dart';
import 'package:movie_stream_app/features/navigation/presentation/bloc/navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationState.initial()) {
    on<NavigationTabChanged>(_onTabChanged);
    on<SearchOpened>(_onSearchOpened);
    on<SearchClosed>(_onSearchClosed);
  }

  void _onTabChanged(
    NavigationTabChanged event,
    Emitter<NavigationState> emit,
  ) {
    emit(state.copyWith(currentIndex: event.index, showSearch: false));
  }

  void _onSearchOpened(SearchOpened event, Emitter<NavigationState> emit) {
    emit(state.copyWith(showSearch: true));
  }

  void _onSearchClosed(SearchClosed event, Emitter<NavigationState> emit) {
    emit(state.copyWith(showSearch: false));
  }
}
