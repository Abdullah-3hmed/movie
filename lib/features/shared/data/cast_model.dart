import 'package:equatable/equatable.dart';

class CastModel extends Equatable {
  final int id;
  final String image;
  final String name;
  final String character;
  const CastModel({
    required this.id,
    required this.image,
    required this.name,
    required this.character,
  });
  factory CastModel.fromJson(Map<String, dynamic> json) => CastModel(
    id: json['id'],
    image: json['profile_path'] ?? "",
    name: json['original_name'] ?? "",
    character: json['character'] ?? "",
  );

  @override
  List<Object?> get props => [id, image, name, character];
}
