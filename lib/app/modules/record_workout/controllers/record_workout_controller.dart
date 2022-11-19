import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:workout_app/app/domain/model/exercise.dart';

class RecordWorkoutController extends GetxController {
  final _exercises = RxList<Exercise>();

  List<Exercise> get exercises => _exercises();

  final _exerciseSelection = Exercise.example().obs;

  Exercise get exerciseSelection => _exerciseSelection();

  final repsTextController = TextEditingController();
  final weightUsedTextController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    repsTextController.text = _exerciseSelection.value.reps.toString();
    repsTextController.addListener(() {
      final reps = int.tryParse(repsTextController.text);
      _exerciseSelection.value = _exerciseSelection.value.copyWith(reps: reps ?? 1);
    });

    weightUsedTextController.addListener(() {
      final weightUsed = double.tryParse(weightUsedTextController.text);
      _exerciseSelection.value = _exerciseSelection.value.copyWith(weightUsed: weightUsed);
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    repsTextController.dispose();
    weightUsedTextController.dispose();
  }

  void addExercise() {
    final exercise = _exerciseSelection();
    _exercises.add(exercise);
  }

  void onExerciseTypeSelected(ExerciseType selectedExercise) {
    _exerciseSelection.value = _exerciseSelection().copyWith(type: selectedExercise);
  }
}
