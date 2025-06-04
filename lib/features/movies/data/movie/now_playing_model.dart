import 'package:equatable/equatable.dart';

class MovieNowPlayingModel extends Equatable {
  final int id;
  final String title;
  final String posterPath;
  final int voteCount;
  final double voteAverage;
  final String releaseDate;

  const MovieNowPlayingModel({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.voteCount,
    required this.releaseDate,
    required this.voteAverage,
  });

  factory MovieNowPlayingModel.fromJson(Map<String, dynamic> json) {
    return MovieNowPlayingModel(
      id: json['id'],
      title: json['original_title'],
      posterPath: json['poster_path'],
      voteCount: json['vote_count'],
      releaseDate: json['release_date'],
      voteAverage: json['vote_average'],
    );
  }

  @override
  List<Object> get props => [
    id,
    title,
    posterPath,
    voteCount,
    releaseDate,
    voteAverage,
  ];
}
