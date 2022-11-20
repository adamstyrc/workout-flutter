import 'package:get/get.dart';

import 'record_workout_controller.dart';

class RecordWorkoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RecordWorkoutController>(
      () => RecordWorkoutController(
        addUserWorkoutUseCase: Get.find(),
      ),
    );
  }
}
