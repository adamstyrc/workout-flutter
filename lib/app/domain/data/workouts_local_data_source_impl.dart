import 'package:rxdart/rxdart.dart';
import 'package:workout_app/app/domain/data/workouts_local_data_source.dart';
import 'package:workout_app/app/domain/model/workout.dart';

class WorkoutsLocalDataSourceImpl extends WorkoutsLocalDataSource {
  final _workouts = BehaviorSubject<List<Workout>>();

  @override
  Future<Workout> addUserWorkout(Workout workout) async {
    final newWorkouts = List<Workout>.from(_workouts.valueOrNull ?? []);
    newWorkouts.add(workout);
    _workouts.add(newWorkouts);
    return workout;
  }

  @override
  Stream<List<Workout>> observeUserWorkouts() {
    return _workouts.stream;
  }
}
