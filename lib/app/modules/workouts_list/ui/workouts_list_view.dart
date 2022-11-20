import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:workout_app/app/routes/app_pages.dart';

import 'workouts_list_controller.dart';

final _dateFormat = DateFormat('HH:mm:ss');

class WorkoutsListView extends GetView<WorkoutsListController> {
  const WorkoutsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.RECORD_WORKOUT);
        },
        child: const Text('+'),
      ),
      appBar: AppBar(
        title: const Text('My Workouts'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemBuilder: _buildWorkoutItem,
                  itemCount: controller.workouts.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWorkoutItem(context, index) {
    final workout = controller.workouts[index];
    final name = workout.name;
    final date = workout.createdAt;

    return Card(
      margin: const EdgeInsets.all(8.0),
      // elevation: 4,
      child: Container(
        color: Colors.black12,
        height: 120,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(name),
                  Text(_dateFormat.format(date)),
                  Text('Exercises count: ${workout.exercises.length}'),
                ],
              ),
              Column(
                children: [
                  TextButton(onPressed: () => controller.editWorkout(workout), child: const Text('Edit')),
                  TextButton(
                    onPressed: () => controller.deleteWorkout(workout.id),
                    child: const Text('Delete'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
