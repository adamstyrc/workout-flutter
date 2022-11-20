import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workout_app/app/routes/app_pages.dart';

import 'workouts_list_controller.dart';

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
    final name = controller.workouts[index].name;
    final date = controller.workouts[index].createdAt;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.black12,
        height: 100,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(name),
              Text('$date'),
            ],
          ),
        ),
      ),
    );
  }
}
