import 'package:equatable/equatable.dart';

class MoviesModel extends Equatable {
  final int id;
  final String title;
  final String backdropPath;
  final double voteAverage;
  final int voteCount;
  final String year;
  final List<int> genreIds;

  const MoviesModel({
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.voteAverage,
    required this.genreIds,
    required this.voteCount,
    required this.year,
  });

  factory MoviesModel.fromJson(Map<String, dynamic> json) {
    return MoviesModel(
      id: json['id'],
      title: json['original_title'] ?? "",
      backdropPath: json['backdrop_path'] ?? "",
      voteCount: json['vote_count'].toInt(),
      voteAverage: (json['vote_average'] ?? 0).toDouble(),
      year: json['release_date'].split('-')[0] ?? "",
      genreIds: List<int>.from(json['genre_ids'] ?? []),
    );
  }
  static const empty = MoviesModel(
    id: 0,
    title: '',
    backdropPath: '',
    voteAverage: 0.0,
    genreIds: [],
    voteCount: 0,
    year: '',
  );

  @override
  List<Object> get props => [
    id,
    title,
    backdropPath,
    voteAverage,
    genreIds,
    voteCount,
    year,
  ];
}
