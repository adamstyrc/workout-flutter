import 'package:get/get.dart';

import '../controllers/workouts_list_controller.dart';

class WorkoutsListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WorkoutsListController>(
      () => WorkoutsListController(),
    );
  }
}
