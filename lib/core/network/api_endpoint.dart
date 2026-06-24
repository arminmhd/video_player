abstract class ApiEndpoint {
  static const baseUrl = 'https://api.themoviedb.org/3';
  static const trendingMovies = '/trending/movie/week';
  static const popularMovies = '/movie/popular';
  static const nowPlayingMovies = '/movie/now_playing';
  static const searchMulti = '/search/multi';
  static const searchMovies = '/search/movie';
  static const searchTvShows = '/search/tv';
  static String movieDetail(int id) => '/movie/$id';
}
