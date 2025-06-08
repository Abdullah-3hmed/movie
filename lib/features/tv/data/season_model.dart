import 'package:equatable/equatable.dart';

class SeasonModel extends Equatable {
  final int id;
  final String name;
  final String posterPath;
  final double voteAverage;
  final String releaseDate;
  final int seasonNumber;
  const SeasonModel({
    required this.id,
    required this.name,
    required this.posterPath,
    required this.voteAverage,
    required this.releaseDate,
    required this.seasonNumber,
  });
  factory SeasonModel.fromJson(Map<String, dynamic> json) => SeasonModel(
    id: json['id'],
    name: json['name'] ?? "",
    posterPath: json['poster_path'] ?? "",
    voteAverage: json['vote_average'].toDouble() ?? "",
    releaseDate: json['air_date'] ?? "",
    seasonNumber: json['season_number'] ?? 0,
  );
  @override
  List<Object> get props => [
    id,
    name,
    posterPath,
    voteAverage,
    releaseDate,
    seasonNumber,
  ];
}
