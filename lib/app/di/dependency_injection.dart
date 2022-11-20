import 'package:get/get.dart';
import 'package:workout_app/app/domain/data/workouts_local_data_source.dart';
import 'package:workout_app/app/domain/data/workouts_local_data_source_impl.dart';
import 'package:workout_app/app/domain/data/workouts_repository.dart';
import 'package:workout_app/app/domain/data/workouts_repository_impl.dart';
import 'package:workout_app/app/domain/use_case/add_user_workout_use_case.dart';
import 'package:workout_app/app/domain/use_case/delete_user_workout_use_case.dart';
import 'package:workout_app/app/domain/use_case/observe_user_workouts_use_case.dart';

class DependencyInjection {
  Future<void> init() async {
    Get.put<WorkoutsLocalDataSource>(WorkoutsLocalDataSourceImpl(), permanent: true);
    Get.put<WorkoutsRepository>(WorkoutsRepositoryImpl(localDataSource: Get.find()), permanent: true);
    Get.create(() => AddUserWorkoutUseCase(workoutsRepository: Get.find()));
    Get.create(() => DeleteUserWorkoutUseCase(workoutsRepository: Get.find()));
    Get.create(() => ObserveUserWorkoutsUseCase(workoutsRepository: Get.find()));
  }
}
