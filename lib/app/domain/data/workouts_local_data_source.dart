import 'package:workout_app/app/domain/model/workout.dart';

abstract class WorkoutsLocalDataSource {

  Future<Workout> addUserWorkout(Workout workout);

  Stream<List<Workout>> observeUserWorkouts();

}
