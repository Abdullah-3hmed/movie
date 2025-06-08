import 'package:equatable/equatable.dart';

class OnTheAirTvModel extends Equatable {
  final int id;
  final String name;
  final String backdropPath;
  final String firstAirDate;
  final double voteAverage;
  final int voteCount;

  const OnTheAirTvModel({
    required this.id,
    required this.name,
    required this.backdropPath,
    required this.firstAirDate,
    required this.voteAverage,
    required this.voteCount,
  });

  factory OnTheAirTvModel.fromJson(Map<String, dynamic> json) =>
      OnTheAirTvModel(
        id: json["id"],
        name: json["original_name"] ?? "",
        backdropPath: json["backdrop_path"] ?? "",
        firstAirDate: json["first_air_date"] ?? "",
        voteAverage: json["vote_average"].toDouble() ?? 0.0,
        voteCount: json["vote_count"] ?? 0,
      );

  @override
  List<Object> get props => [
    id,
    name,
    backdropPath,
    firstAirDate,
    voteAverage,
    voteCount,
  ];
}
