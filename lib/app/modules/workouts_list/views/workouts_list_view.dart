import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/workouts_list_controller.dart';

class WorkoutsListView extends GetView<WorkoutsListController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WorkoutsListView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'WorkoutsListView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
