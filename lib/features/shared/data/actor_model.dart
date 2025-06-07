import 'package:equatable/equatable.dart';

class ActorModel extends Equatable {
  final String name;
  final String image;
  final String birthday;
  final String placeOfBirth;
  final String biography;

  const ActorModel({
    required this.name,
    required this.image,
    required this.birthday,
    required this.placeOfBirth,
    required this.biography,
  });

  factory ActorModel.fromJson(Map<String, dynamic> json) => ActorModel(
    name: json['name'] ?? "",
    image: json['profile_path'] ?? "",
    birthday: json['birthday'] ?? "",
    placeOfBirth: json['place_of_birth'] ?? "",
    biography: json['biography'] ?? "",
  );
  static const empty = ActorModel(
    name: '',
    image: '',
    birthday: '',
    placeOfBirth: '',
    biography: '',
  );

  @override
  List<Object> get props => [name, image, birthday, placeOfBirth, biography];
}
