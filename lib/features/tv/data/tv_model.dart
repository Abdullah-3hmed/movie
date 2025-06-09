import 'package:equatable/equatable.dart';

class TvModel extends Equatable {
  final int id;
  final String name;
  final String backdropPath;
  final List<int> genreIds;
  final double voteAverage;
  final String year;
  final int voteCount;

  const TvModel({
    required this.id,
    required this.name,
    required this.backdropPath,
    required this.genreIds,
    required this.voteAverage,
    required this.voteCount,
    required this.year,
  });

  factory TvModel.fromJson(Map<String, dynamic> json) {
    return TvModel(
      id: json['id'],
      name: json['original_name'] ?? "",
      backdropPath: json['backdrop_path'] ?? "",
      genreIds: List<int>.from(json['genre_ids'] ?? []),
      voteAverage: json['vote_average'].toDouble() ?? 0.0,
      year: json['first_air_date'].split('-')[0] ?? "",
      voteCount: json['vote_count'] ?? 0,
    );
  }

  @override
  List<Object> get props => [
    id,
    name,
    backdropPath,
    genreIds,
    voteAverage,
    year,
    voteCount,
  ];
}
