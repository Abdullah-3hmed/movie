// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [ActorDetailsScreen]
class ActorDetailsRoute extends PageRouteInfo<ActorDetailsRouteArgs> {
  ActorDetailsRoute({
    Key? key,
    required int actorId,
    List<PageRouteInfo>? children,
  }) : super(
         ActorDetailsRoute.name,
         args: ActorDetailsRouteArgs(key: key, actorId: actorId),
         initialChildren: children,
       );

  static const String name = 'ActorDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ActorDetailsRouteArgs>();
      return WrappedRoute(
        child: ActorDetailsScreen(key: args.key, actorId: args.actorId),
      );
    },
  );
}

class ActorDetailsRouteArgs {
  const ActorDetailsRouteArgs({this.key, required this.actorId});

  final Key? key;

  final int actorId;

  @override
  String toString() {
    return 'ActorDetailsRouteArgs{key: $key, actorId: $actorId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ActorDetailsRouteArgs) return false;
    return key == other.key && actorId == other.actorId;
  }

  @override
  int get hashCode => key.hashCode ^ actorId.hashCode;
}

/// generated route for
/// [Auth]
class AuthRoute extends PageRouteInfo<void> {
  const AuthRoute({List<PageRouteInfo>? children})
    : super(AuthRoute.name, initialChildren: children);

  static const String name = 'AuthRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const Auth());
    },
  );
}

/// generated route for
/// [BottomNavBarScreen]
class BottomNavBarRoute extends PageRouteInfo<void> {
  const BottomNavBarRoute({List<PageRouteInfo>? children})
    : super(BottomNavBarRoute.name, initialChildren: children);

  static const String name = 'BottomNavBarRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const BottomNavBarScreen();
    },
  );
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoginScreen();
    },
  );
}

/// generated route for
/// [MovieDetailsScreen]
class MovieDetailsRoute extends PageRouteInfo<MovieDetailsRouteArgs> {
  MovieDetailsRoute({
    Key? key,
    required int movieId,
    List<PageRouteInfo>? children,
  }) : super(
         MovieDetailsRoute.name,
         args: MovieDetailsRouteArgs(key: key, movieId: movieId),
         initialChildren: children,
       );

  static const String name = 'MovieDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MovieDetailsRouteArgs>();
      return WrappedRoute(
        child: MovieDetailsScreen(key: args.key, movieId: args.movieId),
      );
    },
  );
}

class MovieDetailsRouteArgs {
  const MovieDetailsRouteArgs({this.key, required this.movieId});

  final Key? key;

  final int movieId;

  @override
  String toString() {
    return 'MovieDetailsRouteArgs{key: $key, movieId: $movieId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MovieDetailsRouteArgs) return false;
    return key == other.key && movieId == other.movieId;
  }

  @override
  int get hashCode => key.hashCode ^ movieId.hashCode;
}

/// generated route for
/// [MoviesScreen]
class MoviesRoute extends PageRouteInfo<void> {
  const MoviesRoute({List<PageRouteInfo>? children})
    : super(MoviesRoute.name, initialChildren: children);

  static const String name = 'MoviesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const MoviesScreen());
    },
  );
}

/// generated route for
/// [ProfileScreen]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfileScreen();
    },
  );
}

/// generated route for
/// [SearchActorsScreen]
class SearchActorsRoute extends PageRouteInfo<void> {
  const SearchActorsRoute({List<PageRouteInfo>? children})
    : super(SearchActorsRoute.name, initialChildren: children);

  static const String name = 'SearchActorsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SearchActorsScreen();
    },
  );
}

/// generated route for
/// [SearchMoviesScreen]
class SearchMoviesRoute extends PageRouteInfo<void> {
  const SearchMoviesRoute({List<PageRouteInfo>? children})
    : super(SearchMoviesRoute.name, initialChildren: children);

  static const String name = 'SearchMoviesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SearchMoviesScreen();
    },
  );
}

/// generated route for
/// [SearchScreen]
class SearchRoute extends PageRouteInfo<void> {
  const SearchRoute({List<PageRouteInfo>? children})
    : super(SearchRoute.name, initialChildren: children);

  static const String name = 'SearchRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SearchScreen();
    },
  );
}

/// generated route for
/// [SearchTvScreen]
class SearchTvRoute extends PageRouteInfo<void> {
  const SearchTvRoute({List<PageRouteInfo>? children})
    : super(SearchTvRoute.name, initialChildren: children);

  static const String name = 'SearchTvRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SearchTvScreen();
    },
  );
}

/// generated route for
/// [SeeAllCastScreen]
class SeeAllCastRoute extends PageRouteInfo<SeeAllCastRouteArgs> {
  SeeAllCastRoute({
    Key? key,
    required List<CastModel> cast,
    List<PageRouteInfo>? children,
  }) : super(
         SeeAllCastRoute.name,
         args: SeeAllCastRouteArgs(key: key, cast: cast),
         initialChildren: children,
       );

  static const String name = 'SeeAllCastRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SeeAllCastRouteArgs>();
      return SeeAllCastScreen(key: args.key, cast: args.cast);
    },
  );
}

class SeeAllCastRouteArgs {
  const SeeAllCastRouteArgs({this.key, required this.cast});

  final Key? key;

  final List<CastModel> cast;

  @override
  String toString() {
    return 'SeeAllCastRouteArgs{key: $key, cast: $cast}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SeeAllCastRouteArgs) return false;
    return key == other.key && const ListEquality().equals(cast, other.cast);
  }

  @override
  int get hashCode => key.hashCode ^ const ListEquality().hash(cast);
}

/// generated route for
/// [SeeAllMoviesScreen]
class SeeAllMoviesRoute extends PageRouteInfo<SeeAllMoviesRouteArgs> {
  SeeAllMoviesRoute({
    Key? key,
    required String title,
    required List<MoviesModel> movies,
    List<PageRouteInfo>? children,
  }) : super(
         SeeAllMoviesRoute.name,
         args: SeeAllMoviesRouteArgs(key: key, title: title, movies: movies),
         initialChildren: children,
       );

  static const String name = 'SeeAllMoviesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SeeAllMoviesRouteArgs>();
      return SeeAllMoviesScreen(
        key: args.key,
        title: args.title,
        movies: args.movies,
      );
    },
  );
}

class SeeAllMoviesRouteArgs {
  const SeeAllMoviesRouteArgs({
    this.key,
    required this.title,
    required this.movies,
  });

  final Key? key;

  final String title;

  final List<MoviesModel> movies;

  @override
  String toString() {
    return 'SeeAllMoviesRouteArgs{key: $key, title: $title, movies: $movies}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SeeAllMoviesRouteArgs) return false;
    return key == other.key &&
        title == other.title &&
        const ListEquality().equals(movies, other.movies);
  }

  @override
  int get hashCode =>
      key.hashCode ^ title.hashCode ^ const ListEquality().hash(movies);
}

/// generated route for
/// [SeeAllTvShowsScreen]
class SeeAllTvShowsRoute extends PageRouteInfo<SeeAllTvShowsRouteArgs> {
  SeeAllTvShowsRoute({
    Key? key,
    required String title,
    required List<TvModel> tvShows,
    List<PageRouteInfo>? children,
  }) : super(
         SeeAllTvShowsRoute.name,
         args: SeeAllTvShowsRouteArgs(key: key, title: title, tvShows: tvShows),
         initialChildren: children,
       );

  static const String name = 'SeeAllTvShowsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SeeAllTvShowsRouteArgs>();
      return SeeAllTvShowsScreen(
        key: args.key,
        title: args.title,
        tvShows: args.tvShows,
      );
    },
  );
}

class SeeAllTvShowsRouteArgs {
  const SeeAllTvShowsRouteArgs({
    this.key,
    required this.title,
    required this.tvShows,
  });

  final Key? key;

  final String title;

  final List<TvModel> tvShows;

  @override
  String toString() {
    return 'SeeAllTvShowsRouteArgs{key: $key, title: $title, tvShows: $tvShows}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SeeAllTvShowsRouteArgs) return false;
    return key == other.key &&
        title == other.title &&
        const ListEquality().equals(tvShows, other.tvShows);
  }

  @override
  int get hashCode =>
      key.hashCode ^ title.hashCode ^ const ListEquality().hash(tvShows);
}

/// generated route for
/// [SelectionScreen]
class SelectionRoute extends PageRouteInfo<void> {
  const SelectionRoute({List<PageRouteInfo>? children})
    : super(SelectionRoute.name, initialChildren: children);

  static const String name = 'SelectionRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SelectionScreen();
    },
  );
}

/// generated route for
/// [Splash]
class SplashTabRoute extends PageRouteInfo<void> {
  const SplashTabRoute({List<PageRouteInfo>? children})
    : super(SplashTabRoute.name, initialChildren: children);

  static const String name = 'SplashTabRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const Splash();
    },
  );
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SplashScreen();
    },
  );
}

/// generated route for
/// [TrailerScreen]
class TrailerRoute extends PageRouteInfo<TrailerRouteArgs> {
  TrailerRoute({
    Key? key,
    required String videoId,
    List<PageRouteInfo>? children,
  }) : super(
         TrailerRoute.name,
         args: TrailerRouteArgs(key: key, videoId: videoId),
         initialChildren: children,
       );

  static const String name = 'TrailerRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TrailerRouteArgs>();
      return TrailerScreen(key: args.key, videoId: args.videoId);
    },
  );
}

class TrailerRouteArgs {
  const TrailerRouteArgs({this.key, required this.videoId});

  final Key? key;

  final String videoId;

  @override
  String toString() {
    return 'TrailerRouteArgs{key: $key, videoId: $videoId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TrailerRouteArgs) return false;
    return key == other.key && videoId == other.videoId;
  }

  @override
  int get hashCode => key.hashCode ^ videoId.hashCode;
}

/// generated route for
/// [TvDetailsScreen]
class TvDetailsRoute extends PageRouteInfo<void> {
  const TvDetailsRoute({List<PageRouteInfo>? children})
    : super(TvDetailsRoute.name, initialChildren: children);

  static const String name = 'TvDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const TvDetailsScreen();
    },
  );
}

/// generated route for
/// [TvOverviewScreen]
class TvOverviewRoute extends PageRouteInfo<void> {
  const TvOverviewRoute({List<PageRouteInfo>? children})
    : super(TvOverviewRoute.name, initialChildren: children);

  static const String name = 'TvOverviewRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const TvOverviewScreen();
    },
  );
}

/// generated route for
/// [TvScreen]
class TvRoute extends PageRouteInfo<void> {
  const TvRoute({List<PageRouteInfo>? children})
    : super(TvRoute.name, initialChildren: children);

  static const String name = 'TvRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const TvScreen());
    },
  );
}

/// generated route for
/// [TvSeasonsScreen]
class TvSeasonsRoute extends PageRouteInfo<void> {
  const TvSeasonsRoute({List<PageRouteInfo>? children})
    : super(TvSeasonsRoute.name, initialChildren: children);

  static const String name = 'TvSeasonsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const TvSeasonsScreen();
    },
  );
}

/// generated route for
/// [WatchListScreen]
class WatchListRoute extends PageRouteInfo<void> {
  const WatchListRoute({List<PageRouteInfo>? children})
    : super(WatchListRoute.name, initialChildren: children);

  static const String name = 'WatchListRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const WatchListScreen();
    },
  );
}
