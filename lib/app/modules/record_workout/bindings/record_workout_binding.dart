import 'package:get/get.dart';

import '../controllers/record_workout_controller.dart';

class RecordWorkoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RecordWorkoutController>(
      () => RecordWorkoutController(),
    );
  }
}
