import 'package:equatable/equatable.dart';
import 'package:movie/core/util/geners.dart';
import 'package:movie/features/movies/data/movies_model.dart';

class MovieDetailsModel extends Equatable {
  final int id;
  final String title;
  final String posterPath;
  final String backdropPath;
  final double voteAverage;
  final int voteCount;
  final String overview;
  final List<String> geners;
  final String country;
  final int length;
  final String year;

  const MovieDetailsModel({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.backdropPath,
    required this.voteAverage,
    required this.voteCount,
    required this.overview,
    required this.geners,
    required this.country,
    required this.length,
    required this.year,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
        id: json['id'],
        title: json['original_title'] ?? '',
        posterPath: json['poster_path'] ?? '',
        backdropPath: json['backdrop_path'] ?? '',
        voteAverage: json['vote_average'].toDouble() ?? 0.0,
        voteCount: json['vote_count'] ?? 0,
        overview: json['overview'] ?? "",
        geners: List<String>.from(json['genres']?.map((e) => e['name'])),
        country: json['origin_country'][0] ?? "",
        length: json['runtime'] ?? 0,
        year: json['release_date']?.split('-')[0],
      );
  static const empty = MovieDetailsModel(
    id: 0,
    title: '',
    posterPath: '',
    backdropPath: '',
    voteAverage: 0.0,
    voteCount: 0,
    overview: '',
    geners: [],
    country: '',
    length: 0,
    year: "",
  );

  MoviesModel toMoviesModel() {
    return MoviesModel(
      id: id,
      title: title,
      backdropPath: backdropPath,
      voteAverage: voteAverage,
      voteCount: voteCount,
      year: year,
      genreIds:
          geners
              .map((name) => genreNameToIdMap[name])
              .whereType<int>()
              .toList(),
    );
  }

  @override
  List<Object?> get props => [
    id,
    title,
    posterPath,
    voteAverage,
    voteCount,
    overview,
    geners,
    country,
    length,
    backdropPath,
    year,
  ];
}
