import 'package:dartz/dartz.dart';
import 'package:movie/core/error/failures.dart';
import 'package:movie/features/movies/data/movie/movies_model.dart';
import 'package:movie/features/movies/data/movie_details/movie_details_model.dart';
import 'package:movie/features/shared/data/cast_model.dart';
import 'package:movie/features/shared/data/review_model.dart';

abstract class MovieDetailsRepo {
  Future<Either<Failure, MovieDetailsModel>> getMovieDetails({
    required int movieId,
  });
  Future<Either<Failure, List<CastModel>>> getMovieCast({required int movieId});
  Future<Either<Failure, List<MoviesModel>>> getRecommendedMovies({
    required int movieId,
  });
  Future<Either<Failure, List<MoviesModel>>> getSimilarMovies({
    required int movieId,
  });
  Future<Either<Failure, List<ReviewModel>>> getMovieReviews({
    required int movieId,
  });
  Future<Either<Failure, String>> getMovieTrailer({required int movieId});
}
