import 'package:freezed_annotation/freezed_annotation.dart';

part 'exercise.freezed.dart';

@freezed
class Exercise with _$Exercise {
  const factory Exercise({
    required ExerciseType type,
    required int reps,
    // weight in kilograms
    double? weightUsed,
  }) = _Exercise;

  factory Exercise.example() => const Exercise(
        type: ExerciseType.barbellRow,
        reps: 10,
        weightUsed: null,
      );
}

enum ExerciseType {
  barbellRow,
  benchPress,
  deadlift,
  squat;

  String get fullName {
    switch (this) {
      case ExerciseType.barbellRow:
        return 'Barbell row';
      case ExerciseType.benchPress:
        return 'Bench press';
      case ExerciseType.deadlift:
        return 'Deadlift';
      case ExerciseType.squat:
        return 'Squat';
    }
  }
}
