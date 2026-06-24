abstract class NavigationEvent {
  const NavigationEvent();
}

class NavigationTabChanged extends NavigationEvent {
  final int index;
  const NavigationTabChanged(this.index);
}

class SearchOpened extends NavigationEvent {}

class SearchClosed extends NavigationEvent {}
