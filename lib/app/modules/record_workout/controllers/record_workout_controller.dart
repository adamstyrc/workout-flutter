import 'package:get/get.dart';
import 'package:workout_app/app/domain/model/exercise.dart';

class RecordWorkoutController extends GetxController {

  final _exercises = RxList<Exercise>();
  List<Exercise> get exercises => _exercises();

  final _exerciseSelection = Exercise.example().obs;
  Exercise get exerciseSelection => _exerciseSelection();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void addExercise() {
    final exercise = Exercise(type: ExerciseType.deadlift, reps: 10, weightUsed: 100);
    _exercises.add(exercise);
  }

  void onExerciseTypeSelected(ExerciseType selectedExercise) {
    // _exerciseSelection = exerciseSelection
  }
}
