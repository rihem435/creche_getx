import 'package:app/controllers/home_controller.dart';
import 'package:app/controllers/profile_controller.dart';
import 'package:get/get.dart';

class AllBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ProfileController(),
    );
    Get.lazyPut(
      () => HomeController(),
    );
  }
}
