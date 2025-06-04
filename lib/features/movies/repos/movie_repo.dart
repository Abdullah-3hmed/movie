import 'package:dartz/dartz.dart';
import 'package:movie/core/error/failures.dart';
import 'package:movie/features/movies/data/movie/now_playing_model.dart';

abstract class MovieRepo {
  Future<Either<Failure, List<MovieNowPlayingModel>>> getNowPlayingMovies();
}
