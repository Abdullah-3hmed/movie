import 'package:equatable/equatable.dart';

class ReviewModel extends Equatable {
  final String author;
  final double rating;
  final String content;

  const ReviewModel({
    required this.author,
    required this.rating,
    required this.content,
  });
  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      author: json['author'],
      rating: json["author_details"]['rating'] ?? 0.0,
      content: json['content'],
    );
  }
  @override
  List<Object> get props => [author, rating, content];
}
