import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';
import 'package:workout_app/app/domain/model/workout.dart';
import 'package:workout_app/app/domain/use_case/delete_user_workout_use_case.dart';
import 'package:workout_app/app/domain/use_case/observe_user_workouts_use_case.dart';
import 'package:workout_app/app/routes/app_pages.dart';

class WorkoutsListController extends GetxController {
  final ObserveUserWorkoutsUseCase _observeUserRecordedWorkoutsUseCase;
  final DeleteUserWorkoutUseCase _deleteUserWorkoutUseCase;

  WorkoutsListController({
    required ObserveUserWorkoutsUseCase observeUserRecordedWorkoutsUseCase,
    required DeleteUserWorkoutUseCase deleteUserWorkoutUseCase,
  })  : _observeUserRecordedWorkoutsUseCase = observeUserRecordedWorkoutsUseCase,
        _deleteUserWorkoutUseCase = deleteUserWorkoutUseCase;

  final _subscriptions = CompositeSubscription();

  final _workouts = RxList<Workout>();

  List<Workout> get workouts => _workouts();

  @override
  void onInit() {
    super.onInit();

    _subscriptions.add(
      _observeUserRecordedWorkoutsUseCase.call().listen((workouts) {
        _workouts.clear();
        workouts.sort((workout1, workout2) => workout1.createdAt.compareTo(workout2.createdAt));
        _workouts.addAll(workouts);
      }),
    );
  }

  @override
  void onClose() {
    _subscriptions.dispose();
  }

  Future<void> deleteWorkout(String workoutId) async {
    await _deleteUserWorkoutUseCase.call(workoutId);
  }

  void editWorkout(Workout workout) {
    Get.toNamed(Routes.RECORD_WORKOUT, arguments: workout);
  }
}
