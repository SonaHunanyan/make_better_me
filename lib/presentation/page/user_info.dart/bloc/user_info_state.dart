import 'package:equatable/equatable.dart';
import 'package:make_better_me/domain/entity/achievement.dart';
import 'package:uuid/uuid.dart';

abstract class UserInfoState extends Equatable {
  @override
  List<Object?> get props => [];
}

class UserInfoInitialState extends UserInfoState {}

class StepsLoadedSuccessfuly extends UserInfoState {
  StepsLoadedSuccessfuly({required this.stepsCount});
  final int stepsCount;
  @override
  List<Object?> get props => [stepsCount];
}

class FailToLoadSteps extends UserInfoState {
  final _id = const Uuid().v4();
  @override
  List<Object?> get props => [_id];
}

class AchievementsLoadedSuccessfuly extends UserInfoState {
  AchievementsLoadedSuccessfuly({required this.achievements});
  final List<Achievement> achievements;
  @override
  List<Object?> get props => achievements;
}

class FailToLoadAchievements extends UserInfoState {
  final _id = const Uuid().v4();
  @override
  List<Object?> get props => [_id];
}
