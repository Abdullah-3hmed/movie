import 'package:dartz/dartz.dart';
import 'package:movie/core/error/failures.dart';
import 'package:movie/features/movies/data/movies_model.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<MoviesModel>>> searchMovies({
    required String movieName,
  });
}
