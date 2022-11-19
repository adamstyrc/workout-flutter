import 'package:workout_app/app/domain/model/exercise.dart';

class Workout {
  final String id;
  final DateTime createdAt;
  final String name;
  final List<Exercise> exercises;

  Workout({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.exercises,
  });
}
