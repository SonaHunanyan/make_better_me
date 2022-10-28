import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User(
      {required this.id,
      required this.name,
      required this.login,
      required this.password});
  final String id;
  final String name;
  final String login;
  final String password;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      name: json['name'] as String,
      login: json['login'] as String,
      password: json['password'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'login': login,
      'password': password,
    };
  }

  @override
  List<Object?> get props => [id, name];
}
