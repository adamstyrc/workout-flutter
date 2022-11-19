import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workout_app/app/di/dependency_injection.dart';
import 'package:workout_app/app/routes/app_pages.dart';

Future<void> main() async {
  await DependencyInjection().init();
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}