import 'package:dartz/dartz.dart';
import 'package:movie/core/error/failures.dart';
import 'package:movie/features/movies/data/movies_model.dart';
import 'package:movie/features/movies/data/up_coming_movies_model.dart';

abstract class MovieRepo {
  Future<Either<Failure, List<UpComingMoviesModel>>> getUpComingMovies();
  Future<Either<Failure, List<MoviesModel>>> getNowPlayingMovies();
  Future<Either<Failure, List<MoviesModel>>> getTopRatedMovies();
  Future<Either<Failure, List<MoviesModel>>> getPopularMovies();
}
