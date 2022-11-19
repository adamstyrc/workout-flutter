import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workout_app/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

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
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.toNamed(Routes.WORKOUTS_LIST);
          },
          child: Text('List'),
        ),
      ),
    );
  }
}
