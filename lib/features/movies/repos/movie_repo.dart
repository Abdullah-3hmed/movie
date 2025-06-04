import 'package:dartz/dartz.dart';
import 'package:movie/core/error/failures.dart';
import 'package:movie/features/movies/data/movie/movies_model.dart';
import 'package:movie/features/movies/data/movie/up_coming_movies_model.dart';

abstract class MovieRepo {
  Future<Either<Failure, List<UpComingMoviesModel>>> getUpComingMovies();
  Future<Either<Failure, List<MoviesModel>>> getNowPlayingMovies();
  Future<Either<Failure, List<MoviesModel>>> getTopRatedMovies();
  Future<Either<Failure, List<MoviesModel>>> getPopularMovies();
}
