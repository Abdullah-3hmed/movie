class ApiConstants {
  static const baseUrl = 'https://api.themoviedb.org/3';
  static const requestTokenEndpoint = '/authentication/token/new';
  static const validateLoginEndpoint =
      '/authentication/token/validate_with_login';
  static const createSessionEndpoint = '/authentication/session/new';
  static const signupEndpoint = '/signup';
  static const nowPlayingMoviesEndpoint = '/movie/now_playing';
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';

  static String imageUrl(String path) => '$baseImageUrl$path';
}
