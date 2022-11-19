import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:workout_app/app/domain/model/exercise.dart';

import '../controllers/record_workout_controller.dart';

class RecordWorkoutView extends GetView<RecordWorkoutController> {
  const RecordWorkoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('New workout'),
          centerTitle: true,
        ),
        body: Obx(
          () => PageView.builder(
            itemBuilder: (BuildContext context, int index) => Obx(() => _buildPageItem(context, index)),
            itemCount: controller.exercises.length + 1,
            controller: PageController(
              viewportFraction: 0.8,
              initialPage: 0,
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
    return Container(
      color: Colors.white,
      child: Column(
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
            child: const Text('Add'),
          ),
        ],
      ),
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
    return Container(
      color: index % 2 == 0 ? Colors.red : Colors.blue,
      child: Column(
        children: [
          const SizedBox(height: 64),
          Text(exercise.type.fullName),
          const SizedBox(height: 16),
          Text('Reps: ${exercise.reps}'),
          if (exercise.weightUsed != null)
            Text('Weight used: ${exercise.weightUsed}')

        ],
      ),
    );
  }
}
