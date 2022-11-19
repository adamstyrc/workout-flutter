import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';
import 'package:workout_app/app/domain/model/exercise.dart';
import 'package:workout_app/app/domain/model/workout.dart';
import 'package:workout_app/app/domain/use_case/add_user_workout_use_case.dart';
import 'package:workout_app/app/domain/use_case/observe_user_workouts_use_case.dart';

class WorkoutsListController extends GetxController {
  final ObserveUserWorkoutsUseCase _observeUserRecordedWorkoutsUseCase;
  final AddUserWorkoutUseCase _addUserWorkoutUseCase;

  WorkoutsListController({
    required ObserveUserWorkoutsUseCase observeUserRecordedWorkoutsUseCase,
    required AddUserWorkoutUseCase addUserWorkoutUseCase,
  })  : _observeUserRecordedWorkoutsUseCase = observeUserRecordedWorkoutsUseCase,
        _addUserWorkoutUseCase = addUserWorkoutUseCase;

  final _subscriptions = CompositeSubscription();

  final _workouts = RxList<Workout>();

  List<Workout> get workouts => _workouts();

  @override
  void onInit() {
    super.onInit();

    _subscriptions.add(
      _observeUserRecordedWorkoutsUseCase.call().listen((workouts) {
        _workouts.clear();
        _workouts.addAll(workouts);
      }),
    );
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    _subscriptions.dispose();
  }

  void onAddButton() {
    final workout = Workout(name: 'New added workout', exercises: [
      Exercise(
        type: ExerciseType.deadlift,
        reps: 12,
        weightUsed: 100,
      ),
    ]);
    _addUserWorkoutUseCase.call(workout);
    // _workouts.add(Workout(name: 'ccc'));
  }
}
