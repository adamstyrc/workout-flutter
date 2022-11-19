import 'package:flutter/material.dart';
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
            itemBuilder: _buildPageItem,
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
      return Container(
        color: index % 2 == 0 ? Colors.red : Colors.blue,
        child: Column(
          children: [
            DropdownButton(
              items: ExerciseType.values.map((e) => DropdownMenuItem<ExerciseType>(child: Text(e.name))).toList(),
              onChanged: (selectedExercise) {
                print(selectedExercise?.toString());
              },
            )
          ],
        ),
      );
    } else {
      return Container(
        color: Colors.white,
        child: Column(children: [
          DropdownButton(
            value: controller.exerciseSelection.type,
            items: ExerciseType.values
                .map((e) => DropdownMenuItem<ExerciseType>(
                      child: Text(e.name),
                      value: e,
                    ))
                .toList(),
            onChanged: (selectedExercise) {
              if (selectedExercise != null) {
                controller.onExerciseTypeSelected(selectedExercise);
              }
            },
            // selectedItemBuilder: (context) => Text('aaa'),
          ),
          ElevatedButton(
            onPressed: controller.addExercise,
            child: const Text('Add'),
          ),
        ]),
      );
    }
  }
}
