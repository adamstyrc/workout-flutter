import 'package:workout_app/app/domain/data/workouts_repository.dart';
import 'package:workout_app/app/domain/model/workout.dart';

class EditUserWorkoutUseCase {
  final WorkoutsRepository _workoutsRepository;

  EditUserWorkoutUseCase({
    required WorkoutsRepository workoutsRepository,
  }) : _workoutsRepository = workoutsRepository;

  Future<Workout> call(Workout workout) {
    return _workoutsRepository.editUserWorkout(workout);
  }
}
