class NavigationState {
  final int currentIndex;
  final bool showSearch;
  const NavigationState({required this.currentIndex, required this.showSearch});

  factory NavigationState.initial() {
    return NavigationState(currentIndex: 0, showSearch: false);
  }

  NavigationState copyWith({int? currentIndex, bool? showSearch}) {
    return NavigationState(
      currentIndex: currentIndex ?? this.currentIndex,
      showSearch: showSearch ?? this.showSearch,
    );
  }
}
