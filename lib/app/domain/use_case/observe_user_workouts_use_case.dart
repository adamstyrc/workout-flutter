import 'package:workout_app/app/domain/data/workouts_repository.dart';
import 'package:workout_app/app/domain/model/exercise.dart';
import 'package:workout_app/app/domain/model/workout.dart';

class ObserveUserWorkoutsUseCase {
  final WorkoutsRepository _workoutsRepository;

  ObserveUserWorkoutsUseCase({
    required WorkoutsRepository workoutsRepository,
  }) : _workoutsRepository = workoutsRepository;

  Stream<List<Workout>> call() {
    return _workoutsRepository.observeUserWorkouts();
    return Stream.value([
      Workout(
        name: 'Workout #1',
        exercises: [
          Exercise(
            type: ExerciseType.deadlift,
            reps: 12,
            weightUsed: 100,
          ),
        ],
      ),
    ]);
  }
}
