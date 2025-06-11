class ApiConstants {
  static const baseUrl = 'https://api.themoviedb.org/3';
  static const requestTokenEndpoint = '/authentication/token/new';
  static const validateLoginEndpoint =
      '/authentication/token/validate_with_login';
  static const createSessionEndpoint = '/authentication/session/new';
  static const signupEndpoint = '/signup';
  ///// movie endpoints
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

  static String movieVideosEndpoint(int movieId) => '/movie/$movieId/videos';
  ////////tv endpoints
  static const tvAiringTodayEndpoint = '/tv/airing_today';
  static const tvOnTheAirEndpoint = '/tv/on_the_air';
  static const tvPopularEndpoint = '/tv/popular';
  static const tvTopRatedEndpoint = '/tv/top_rated';
  ///////tv details
  static String tvDetailsEndpoint(int tvId) => '/tv/$tvId';
  static String tvCastEndpoint(int tvId) => '/tv/$tvId/credits';
  static String tvSimilarEndpoint(int tvId) => '/tv/$tvId/similar';
  static String tvRecommendedEndpoint(int tvId) => '/tv/$tvId/recommendations';
  static String tvReviewsEndpoint(int tvId) => '/tv/$tvId/reviews';
  static String tvVideosEndpoint(int tvId) => '/tv/$tvId/videos';

  ///search endpoints
  static const searchMovieEndpoint = '/search/movie';
  static const searchTvEndpoint = '/search/tv';
  static const searchPersonEndpoint = '/search/person';

  /// profile endPoints
  static const accountIdEndpoint = '/account';
  static String watchListMoviesEndpoint(int accountId) =>
      '/account/$accountId/watchlist/movies';
  static String watchListTvEndpoint(int accountId) =>
      '/account/$accountId/watchlist/tv';
  static String watchListEndpoint(int accountId) =>
      '/account/$accountId/watchlist';
  static String imageUrl(String path) => '$baseImageUrl$path';
}
