import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/record_workout_controller.dart';

class RecordWorkoutView extends GetView<RecordWorkoutController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text('+'),
      ),
      appBar: AppBar(
        title: Text('New workout'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'RecordWorkoutView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
