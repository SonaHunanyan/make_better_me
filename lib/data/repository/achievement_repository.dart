import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:make_better_me/domain/entity/achievement.dart';
import 'package:make_better_me/domain/repository/achievement_repository.dart';

class AchievementRepository implements IAchievementRepository {
  final _collection = FirebaseFirestore.instance.collection('achievement');

  @override
  Future<List<Achievement>> getAchievements() async {
    final achievementsQuerySnapshot =
        await _collection.get().catchError((error) {
      throw Exception('Fail to get categories $error');
    });

    final achievementsJson = achievementsQuerySnapshot.docs;
    final achievements = <Achievement>[];
    for (final element in achievementsJson) {
      final achievement = Achievement.fromJson(element.data());
      achievements.add(achievement);
    }
    return achievements;
  }
}
