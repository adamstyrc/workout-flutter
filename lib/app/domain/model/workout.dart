import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:workout_app/app/domain/model/exercise.dart';

part 'workout.freezed.dart';

@freezed
class Workout with _$Workout {
  const factory Workout({
    required String id,
    required DateTime createdAt,
    required String name,
    required List<Exercise> exercises,
    // weight in kilograms
    double? weightUsed,
  }) = _Workout;
}
