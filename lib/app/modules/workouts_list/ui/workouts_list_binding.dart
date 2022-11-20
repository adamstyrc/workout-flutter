import 'package:get/get.dart';

import 'workouts_list_controller.dart';

class WorkoutsListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WorkoutsListController>(
      () => WorkoutsListController(
        observeUserRecordedWorkoutsUseCase: Get.find(),
        addUserWorkoutUseCase: Get.find(),
      ),
    );
  }
}
