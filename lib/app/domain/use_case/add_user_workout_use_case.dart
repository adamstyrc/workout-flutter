import 'package:workout_app/app/domain/data/workouts_repository.dart';
import 'package:workout_app/app/domain/model/workout.dart';

class AddUserWorkoutUseCase {
  final WorkoutsRepository _workoutsRepository;

  AddUserWorkoutUseCase({
    required WorkoutsRepository workoutsRepository,
  }) : _workoutsRepository = workoutsRepository;

  Future<Workout> call(Workout workout) {
    return _workoutsRepository.addUserWorkout(workout);
  }
}
