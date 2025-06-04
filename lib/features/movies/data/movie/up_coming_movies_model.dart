import 'package:equatable/equatable.dart';

class UpComingMoviesModel extends Equatable {
  final int id;
  final String title;
  final String posterPath;
  final int voteCount;
  final double voteAverage;
  final String releaseDate;

  const UpComingMoviesModel({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.voteCount,
    required this.releaseDate,
    required this.voteAverage,
  });

  factory UpComingMoviesModel.fromJson(Map<String, dynamic> json) {
    return UpComingMoviesModel(
      id: json['id'],
      title: json['original_title'],
      posterPath: json['poster_path'],
      voteCount: json['vote_count'],
      releaseDate: json['release_date'],
      voteAverage: json['vote_average'].toDouble(),
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
