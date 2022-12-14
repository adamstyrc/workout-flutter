
import 'package:workout_app/app/domain/model/workout.dart';

abstract class WorkoutsRepository {

  Future<Workout> addUserWorkout(Workout workout);

  Stream<List<Workout>> observeUserWorkouts();

  Future<void> deleteUserWorkout(String workoutId);

  Future<Workout> editUserWorkout(Workout workout);

}