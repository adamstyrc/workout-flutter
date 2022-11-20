import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:workout_app/app/domain/model/exercise.dart';

import 'record_workout_controller.dart';

class RecordWorkoutView extends GetView<RecordWorkoutController> {
  const RecordWorkoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('New workout'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Obx(
            () => Column(
              children: [
                Expanded(
                  child: PageView.builder(
                      itemBuilder: (BuildContext context, int index) => Obx(() => _buildPageItem(context, index)),
                      itemCount: controller.exercises.length + 1,
                      controller: controller.pageController),
                ),
                ElevatedButton(
                  onPressed: controller.exercises.isNotEmpty
                      ? () {
                          controller.saveWorkout();
                        }
                      : null,
                  child: const Text('Save workout'),
                ),
              ],
            ),
          ),
        ));
  }

  Widget _buildPageItem(BuildContext context, int index) {
    if (index < controller.exercises.length) {
      return _buildExerciseItem(index);
    } else {
      return _buildAddExerciseItem();
    }
  }

  Widget _buildAddExerciseItem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 48),
        DropdownButton(
          value: controller.exerciseSelection.type,
          items: ExerciseType.values
              .map((e) => DropdownMenuItem<ExerciseType>(
                    value: e,
                    child: Text(e.fullName),
                  ))
              .toList(),
          onChanged: (selectedExercise) {
            if (selectedExercise != null) {
              controller.onExerciseTypeSelected(selectedExercise);
            }
          },
          // selectedItemBuilder: (context) => Text('aaa'),
        ),
        const SizedBox(height: 16),
        _buildRepsInput(),
        _buildWeightInput(),
        ElevatedButton(
          onPressed: controller.addExercise,
          child: const Text('Add exercise'),
        ),
      ],
    );
  }

  Widget _buildRepsInput() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Reps:'),
        const SizedBox(width: 16),
        SizedBox(
          height: 64,
          width: 64,
          child: TextField(
            controller: controller.repsTextController,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildWeightInput() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Weight [kg]:'),
        const SizedBox(width: 16),
        SizedBox(
          height: 64,
          width: 64,
          child: TextField(
            controller: controller.weightUsedTextController,
            keyboardType: TextInputType.number,
          ),
        ),
      ],
    );
  }

  Widget _buildExerciseItem(int index) {
    final exercise = controller.exercises[index];
    return Column(
      children: [
        const SizedBox(height: 64),
        Text('Exercise #${index + 1}'),
        const SizedBox(height: 16),
        Text(exercise.type.fullName),
        const SizedBox(height: 16),
        Text('Reps: ${exercise.reps}'),
        if (exercise.weightUsed != null) Text('Weight used: ${exercise.weightUsed}')
      ],
    );
  }
}
