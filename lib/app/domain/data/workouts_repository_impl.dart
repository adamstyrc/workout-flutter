import 'package:workout_app/app/domain/data/workouts_local_data_source.dart';
import 'package:workout_app/app/domain/data/workouts_repository.dart';
import 'package:workout_app/app/domain/model/workout.dart';

class WorkoutsRepositoryImpl extends WorkoutsRepository {
  final WorkoutsLocalDataSource _localDataSource;

  WorkoutsRepositoryImpl({
    required WorkoutsLocalDataSource localDataSource,
  }) : _localDataSource = localDataSource;

  @override
  Future<Workout> addUserWorkout(Workout workout) {
    return _localDataSource.addUserWorkout(workout);
  }

  @override
  Stream<List<Workout>> observeUserWorkouts() {
    return _localDataSource.observeUserWorkouts();
  }

  @override
  Future<void> deleteUserWorkout(String workoutId) {
    return _localDataSource.deleteUserWorkout(workoutId);
  }

  @override
  Future<Workout> editUserWorkout(Workout workout) {
    return _localDataSource.editUserWorkout(workout);
  }
}
