import 'package:equatable/equatable.dart';

class Achievement extends Equatable {
  const Achievement(
      {required this.description,
      required this.id,
      required this.image,
      required this.title});
  final String id;
  final String title;
  final String image;
  final String description;

  factory Achievement.fromJson(Map<String, dynamic> json) {
    return Achievement(
      id: json['id'] as String,
      title: json['title'] as String,
      image: json['image'] as String,
      description: json['description'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'image': image,
      'description': description,
    };
  }

  @override
  List<Object?> get props => [id, title];
}
