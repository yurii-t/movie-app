

import 'package:json_annotation/json_annotation.dart';
part 'movie_details_credit.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake,explicitToJson: true)
class MovieDetailsCredit {
  
  final List<Actor> cast;
  final List<Employee> crew;
  MovieDetailsCredit({
   
    required this.cast,
    required this.crew,
  });
  factory MovieDetailsCredit.fromJson(Map<String,dynamic> json) => _$MovieDetailsCreditFromJson(json);
  Map<String,dynamic> toJson() => _$MovieDetailsCreditToJson(this);
  
}
@JsonSerializable(fieldRename: FieldRename.snake,explicitToJson: true)
class Actor {
  final bool adult;
  final int? gender;
  final int id;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String? profilePath;
  final int castId;
  final String character;
  final String creditId;
  final int order;
  Actor({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
    required this.castId,
    required this.character,
    required this.creditId,
    required this.order,
  });


factory Actor.fromJson(Map<String,dynamic> json) => _$ActorFromJson(json);
  Map<String,dynamic> toJson() => _$ActorToJson(this);
 
}

@JsonSerializable(fieldRename: FieldRename.snake,explicitToJson: true)
class Employee {
  final bool adult;
  final int? gender;
  final int id;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String? profilePath;
  final String creditId;
  final String department;
  final String job;
  Employee({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
    required this.creditId,
    required this.department,
    required this.job,
  });

  factory Employee.fromJson(Map<String,dynamic> json) => _$EmployeeFromJson(json);
  Map<String,dynamic> toJson() => _$EmployeeToJson(this);
}