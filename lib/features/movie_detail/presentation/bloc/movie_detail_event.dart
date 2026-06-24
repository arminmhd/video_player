abstract class MovieDetailEvent {
  const MovieDetailEvent();
}

class MovieDetailRequested extends MovieDetailEvent {
  final int movieId;

  const MovieDetailRequested(this.movieId);
}
