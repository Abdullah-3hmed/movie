import 'package:equatable/equatable.dart';

class ProfileModel extends Equatable {
  final int id;
  final String name;
  final String userName;
  final String avatarPath;

  const ProfileModel({
    required this.id,
    required this.name,
    required this.userName,
    required this.avatarPath,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? "",
      userName: json['username'] ?? "",
      avatarPath: json["avatar"]["tmdb"]['avatar_path'] ?? "",
    );
  }

  static const empty = ProfileModel(
    id: 0,
    name: "",
    userName: "",
    avatarPath: "",
  );

  @override
  List<Object> get props => [id, name, userName, avatarPath];
}
