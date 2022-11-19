import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/workouts_list_controller.dart';

class WorkoutsListView extends GetView<WorkoutsListController> {
  const WorkoutsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WorkoutsListView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemBuilder: (context, index) {
                  final name = controller.workouts[index].name ;
                  final date = controller.workouts[index].createdAt;
                  return Text('$name | $date');
                },
                itemCount: controller.workouts.length,
              ),
            ),
          ),
          ElevatedButton(onPressed: () => controller.onAddButton(), child: const Text('Add')),
        ],
      ),
    );
  }
}
