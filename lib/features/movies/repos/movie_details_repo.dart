import 'package:dartz/dartz.dart';
import 'package:movie/core/error/failures.dart';
import 'package:movie/features/movies/data/movie_details/movie_details_model.dart';

abstract class MovieDetailsRepo {
  Future<Either<Failure, MovieDetailsModel>> getMovieDetails({
    required int movieId,
  });
}
