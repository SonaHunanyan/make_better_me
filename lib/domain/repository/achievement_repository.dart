import 'package:make_better_me/domain/entity/achievement.dart';

abstract class IAchievementRepository{
  Future<List<Achievement>> getAchievements();
}