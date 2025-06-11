import 'package:movie/features/tv/cubit/tv_details_cubit/tv_details_cubit.dart';
import 'package:movie/features/tv/repos/tv_details_repo/tv_details_repo.dart';

class TvDetailsCubitManager {
  final TvDetailsRepo tvDetailsRepo;

  TvDetailsCubitManager({required this.tvDetailsRepo});

  final Map<int, TvDetailsCubit> _cache = {};

  ({TvDetailsCubit cubit, bool isNew}) getOrCreate(int movieId) {
    if (_cache.containsKey(movieId)) {
      return (cubit: _cache[movieId]!, isNew: false);
    } else {
      final newCubit = TvDetailsCubit(tvDetailsRepo: tvDetailsRepo);
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
