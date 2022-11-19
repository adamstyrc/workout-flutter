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
}

enum ExerciseType {
  barbellRow,
  benchPress,
  deadlift,
  squat,
}
