class Exercise {
  final ExerciseType type;
  final int reps;

  // weight in kilograms
  final double? weightUsed;

  Exercise({
    required this.type,
    required this.reps,
    this.weightUsed,
  });

  factory Exercise.example() => Exercise(
        type: ExerciseType.barbellRow,
        reps: 10,
        weightUsed: null,
      );
}

enum ExerciseType {
  barbellRow,
  benchPress,
  deadlift,
  squat,
}
