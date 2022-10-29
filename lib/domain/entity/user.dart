import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User(
      {required this.id,
      required this.name,
      required this.username,
      required this.password,
      this.achievementsId = const []});
  final String id;
  final String name;
  final String username;
  final String password;
  final List<String> achievementsId;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      name: json['name'] as String,
      username: json['username'] as String,
      password: json['password'] as String,
      achievementsId: json['achievementsId'] as List<String>,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'username': username,
      'password': password,
      'achievementsId': achievementsId,
    };
  }

  @override
  List<Object?> get props => [id, name];
}
