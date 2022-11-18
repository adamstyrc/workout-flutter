import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/record_workout_controller.dart';

class RecordWorkoutView extends GetView<RecordWorkoutController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RecordWorkoutView'),
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
