import 'package:equatable/equatable.dart';

class MovieDetailsModel extends Equatable {
  final String title;
  final String posterPath;
  final double voteAverage;
  final int voteCount;
  final String overview;
  final List<String> geners;
  final String country;
  final int length;
  final int year;

  const MovieDetailsModel({
    required this.title,
    required this.posterPath,
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
        title: json['original_title'],
        posterPath: json['poster_path'],
        voteAverage: json['vote_average'].toDouble(),
        voteCount: json['vote_count'],
        overview: json['overview'],
        geners: List<String>.from(json['genres'].map((e) => e['name'])),
        country: json['origin_country'][0],
        length: json['runtime'],
        year: json['release_date'].split('-')[0],
      );
  static const empty = MovieDetailsModel(
    title: '',
    posterPath: '',
    voteAverage: 0.0,
    voteCount: 0,
    overview: '',
    geners: [],
    country: '',
    length: 0,
    year: 0,
  );
  @override
  List<Object?> get props => [
    title,
    posterPath,
    voteAverage,
    voteCount,
    overview,
    geners,
    country,
    length,
    year,
  ];
}
