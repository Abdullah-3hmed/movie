class ApiConstants {
  static const baseUrl = 'https://api.themoviedb.org/3';
  static const requestTokenEndpoint = '/authentication/token/new';
  static const validateLoginEndpoint =
      '/authentication/token/validate_with_login';
  static const createSessionEndpoint = '/authentication/session/new';
  static const signupEndpoint = '/signup';
  static const nowPlayingMoviesEndpoint = '/movie/now_playing';
  static const upComingMoviesEndpoint = '/movie/upcoming';
  static const topRatedMoviesEndpoint = '/movie/top_rated';
  static const popularMoviesEndpoint = '/movie/popular';

  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';

  ///movie details
  static String movieDetailsEndpoint(int movieId) => '/movie/$movieId';
  static String movieCastEndpoint(int movieId) => '/movie/$movieId/credits';
  static String movieSimilarEndpoint(int movieId) => '/movie/$movieId/similar';
  static String movieRecommendedEndpoint(int movieId) =>
      '/movie/$movieId/recommendations';
  static String movieReviewsEndpoint(int movieId) => '/movie/$movieId/reviews';

  //////actor details
  static String actorDetailsEndpoint(int actorId) => '/person/$actorId';
  static String actorMoviesEndpoint(int actorId) =>
      '/person/$actorId/movie_credits';

  static String imageUrl(String path) => '$baseImageUrl$path';
}
