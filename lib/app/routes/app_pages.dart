import 'package:get/get.dart';

import 'package:workout_app/app/modules/home/bindings/home_binding.dart';
import 'package:workout_app/app/modules/home/views/home_view.dart';
import 'package:workout_app/app/modules/record_workout/ui/record_workout_binding.dart';
import 'package:workout_app/app/modules/record_workout/ui/record_workout_view.dart';
import 'package:workout_app/app/modules/workouts_list/ui/workouts_list_binding.dart';
import 'package:workout_app/app/modules/workouts_list/ui/workouts_list_view.dart';

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
      page: () => const WorkoutsListView(),
      binding: WorkoutsListBinding(),
    ),
    GetPage(
      name: _Paths.RECORD_WORKOUT,
      page: () => const RecordWorkoutView(),
      binding: RecordWorkoutBinding(),
    ),
  ];
}
