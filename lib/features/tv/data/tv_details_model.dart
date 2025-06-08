import 'package:equatable/equatable.dart';
import 'package:movie/features/tv/data/season_model.dart';

class TvDetailsModel extends Equatable {
  final int id;
  final String name;
  final String posterPath;
  final String overview;
  final String year;
  final String country;
  final String network;
  final double voteAverage;
  final int voteCount;
  final List<String> geners;
  final List<SeasonModel> seasons;
  const TvDetailsModel({
    required this.id,
    required this.name,
    required this.posterPath,
    required this.overview,
    required this.year,
    required this.country,
    required this.network,
    required this.voteAverage,
    required this.voteCount,
    required this.geners,
    required this.seasons,
  });
  factory TvDetailsModel.fromJson(Map<String, dynamic> json) => TvDetailsModel(
    id: json['id'],
    name: json['name'] ?? "",
    posterPath: json['poster_path'] ?? "",
    overview: json['overview'] ?? "",
    year: json['first_air_date'].split('-')[0] ?? "",
    country: json['origin_country'][0] ?? "",
    network: json['networks'][0]['name'] ?? "",
    voteAverage: json['vote_average'].toDouble() ?? 0.0,
    voteCount: json['vote_count'] ?? 0,
    geners: List<String>.from(json['genres'].map((x) => x['name'])),
    seasons: List<SeasonModel>.from(
      json['seasons'].map((x) => SeasonModel.fromJson(x)),
    ),
  );
  static const TvDetailsModel empty = TvDetailsModel(
    id: 0,
    name: '',
    posterPath: '',
    overview: '',
    year: '',
    country: '',
    network: '',
    voteAverage: 0.0,
    voteCount: 0,
    geners: [],
    seasons: [],
  );
  @override
  List<Object> get props => [
    id,
    name,
    posterPath,
    overview,
    year,
    country,
    network,
    voteAverage,
    voteCount,
    geners,
    seasons,
  ];
}
