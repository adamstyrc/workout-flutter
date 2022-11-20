import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:workout_app/app/domain/model/exercise.dart';
import 'package:workout_app/app/domain/model/workout.dart';
import 'package:workout_app/app/domain/use_case/add_user_workout_use_case.dart';
import 'package:workout_app/app/domain/use_case/edit_user_workout_use_case.dart';

class RecordWorkoutController extends GetxController {
  final AddUserWorkoutUseCase _addUserWorkoutUseCase;
  final EditUserWorkoutUseCase _editUserWorkoutUseCase;

  RecordWorkoutController({
    required AddUserWorkoutUseCase addUserWorkoutUseCase,
    required EditUserWorkoutUseCase editUserWorkoutUseCase,
  })  : _addUserWorkoutUseCase = addUserWorkoutUseCase,
        _editUserWorkoutUseCase = editUserWorkoutUseCase;

  Workout? _editedWorkout;
  bool get isNewWorkout => _editedWorkout == null;

  final _exercises = RxList<Exercise>();
  List<Exercise> get exercises => _exercises();

  final _exerciseSelection = Exercise.example().obs;
  Exercise get exerciseSelection => _exerciseSelection();

  final repsTextController = TextEditingController();
  final weightUsedTextController = TextEditingController();
  final pageController = PageController(
    viewportFraction: 0.6,
    initialPage: 0,
  );

  @override
  void onInit() {
    super.onInit();

    if (Get.arguments != null && Get.arguments is Workout) {
      final workout = Get.arguments as Workout;
      _editedWorkout = workout;
      _exercises.value = List.from(workout.exercises);
    }

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
  void onClose() {
    repsTextController.dispose();
    weightUsedTextController.dispose();
    pageController.dispose();
  }

  void addExercise() {
    final exercise = _exerciseSelection();
    _exercises.add(exercise);

    pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  void onExerciseTypeSelected(ExerciseType selectedExercise) {
    _exerciseSelection.value = _exerciseSelection().copyWith(type: selectedExercise);
  }

  Future<void> saveWorkout() async {
    final workout = _editedWorkout;
    if (workout != null) {
      await _saveExistingWorkout(workout);
    } else {
      await _saveNewWorkout();
    }
  }

  Future<void> _saveNewWorkout() async {
    final id = const Uuid().v4();
    final workout = Workout(
      id: id,
      name: 'My Workout ${id.substring(0, 4)}',
      createdAt: DateTime.now(),
      exercises: exercises,
    );
    await _addUserWorkoutUseCase.call(workout);
    Get.back();
  }

  Future<void> _saveExistingWorkout(Workout workout) async {
    final modifiedWorkout = workout.copyWith(exercises: exercises);
    await _editUserWorkoutUseCase.call(modifiedWorkout);
    Get.back();
  }

  void removeExercise(int index) {
    _exercises.removeAt(index);

    pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }
}
