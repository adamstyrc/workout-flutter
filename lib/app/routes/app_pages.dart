import 'package:get/get.dart';

import 'package:workout_app/app/modules/home/bindings/home_binding.dart';
import 'package:workout_app/app/modules/home/views/home_view.dart';
import 'package:workout_app/app/modules/record_workout/bindings/record_workout_binding.dart';
import 'package:workout_app/app/modules/record_workout/views/record_workout_view.dart';
import 'package:workout_app/app/modules/workouts_list/bindings/workouts_list_binding.dart';
import 'package:workout_app/app/modules/workouts_list/views/workouts_list_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.WORKOUTS_LIST,
      page: () => WorkoutsListView(),
      binding: WorkoutsListBinding(),
    ),
    GetPage(
      name: _Paths.RECORD_WORKOUT,
      page: () => RecordWorkoutView(),
      binding: RecordWorkoutBinding(),
    ),
  ];
}
