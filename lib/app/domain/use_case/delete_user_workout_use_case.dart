import 'package:workout_app/app/domain/data/workouts_repository.dart';
import 'package:workout_app/app/domain/model/workout.dart';

class DeleteUserWorkoutUseCase {
  final WorkoutsRepository _workoutsRepository;

  DeleteUserWorkoutUseCase({
    required WorkoutsRepository workoutsRepository,
  }) : _workoutsRepository = workoutsRepository;

  Future<void> call(String workoutId) {
    return _workoutsRepository.deleteUserWorkout(workoutId);
  }
}
