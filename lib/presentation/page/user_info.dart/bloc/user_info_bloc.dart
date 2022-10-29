import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health/health.dart';
import 'package:make_better_me/presentation/page/user_info.dart/bloc/user_info_event.dart';
import 'package:make_better_me/presentation/page/user_info.dart/bloc/user_info_state.dart';

class UserInfoBloc extends Bloc<UserInfoEvent, UserInfoState> {
  UserInfoBloc() : super(UserInfoInitialState()) {
    on<GetStepsEvent>(_onGetStepsEvent);
  }
  final _health = HealthFactory();

  final _healhTypes = [
    HealthDataType.STEPS,
  ];

  Future<void> _onGetStepsEvent(
      GetStepsEvent event, Emitter<UserInfoState> emit) async {
    try {
      final now = DateTime.now();
      final midnight = DateTime(now.year, now.month, now.day);
      final permissions = [
        HealthDataAccess.READ_WRITE,
      ];
      await _health.requestAuthorization(_healhTypes, permissions: permissions);
      final steps = await _health.getTotalStepsInInterval(midnight, now);
      if (steps == null) {
        emit(FailToLoadSteps());
        return;
      }
      emit(StepsLoadedSuccessfuly(stepsCount: steps));
    } catch (e) {
      emit(FailToLoadSteps());
    }
  }
}
