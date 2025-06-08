import 'package:movie/features/movies/cubit/movie_details/movie_details_cubit.dart';
import 'package:movie/features/movies/repos/movie_details/movie_details_repo.dart';

class MovieDetailsCubitManager {
  final MovieDetailsRepo movieDetailsRepo;

  MovieDetailsCubitManager({required this.movieDetailsRepo});

  final Map<int, MovieDetailsCubit> _cache = {};

  ({MovieDetailsCubit cubit, bool isNew}) getOrCreate(int movieId) {
    if (_cache.containsKey(movieId)) {
      return (cubit: _cache[movieId]!, isNew: false);
    } else {
      final newCubit = MovieDetailsCubit(movieDetailsRepo: movieDetailsRepo);
      _cache[movieId] = newCubit;
      return (cubit: newCubit, isNew: true);
    }
  }

  // void remove(int movieId) {
  //   _cache.remove(movieId)?.close();
  // }

  void clearAll() {
    _cache.forEach((key, value) => value.close());
    _cache.clear();
  }
}
