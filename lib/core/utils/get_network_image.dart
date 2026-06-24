String getPosterUrl(String? path) {
  if (path == null || path.isEmpty) {
    return '';
  }
  return 'https://image.tmdb.org/t/p/w500$path';
}
