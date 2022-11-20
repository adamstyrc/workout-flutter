import 'package:rxdart/rxdart.dart';
import 'package:workout_app/app/domain/data/workouts_local_data_source.dart';
import 'package:workout_app/app/domain/model/workout.dart';

class WorkoutsLocalDataSourceImpl extends WorkoutsLocalDataSource {
  final _workouts = BehaviorSubject<List<Workout>>();

  @override
  Future<Workout> addUserWorkout(Workout workout) async {
    final newWorkouts = List<Workout>.from(_workouts.valueOrNull ?? []);
    newWorkouts.add(workout);
    _workouts.value = newWorkouts;
    return workout;
  }

  @override
  Stream<List<Workout>> observeUserWorkouts() {
    return _workouts.stream;
  }

  @override
  Future<void> deleteUserWorkout(String workoutId) async {
    final workouts = List<Workout>.from(_workouts.valueOrNull ?? []);
    workouts.removeWhere((element) => element.id == workoutId);
    _workouts.value = workouts;
  }

  @override
  Future<Workout> editUserWorkout(Workout workout) async {
    final newWorkouts = List<Workout>.from(_workouts.valueOrNull ?? []);
    newWorkouts.removeWhere((element) => element.id == workout.id);
    newWorkouts.add(workout);
    _workouts.value = newWorkouts;
    return workout;
  }
}
