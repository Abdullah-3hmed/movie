import 'package:equatable/equatable.dart';

class SearchActorModel extends Equatable {
  final int id;
  final String name;
  final String backdropPath;
  final String knownForDepartment;
  const SearchActorModel({
    required this.id,
    required this.name,
    required this.backdropPath,
    required this.knownForDepartment,
  });
  factory SearchActorModel.fromJson(Map<String, dynamic> json) =>
      SearchActorModel(
        id: json['id'],
        name: json['name'] ?? "",
        backdropPath: json['profile_path'] ?? "",
        knownForDepartment: json['known_for_department'] ?? "",
      );
  @override
  List<Object> get props => [id, name, backdropPath, knownForDepartment];
}
