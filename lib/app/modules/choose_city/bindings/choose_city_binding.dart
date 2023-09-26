import 'package:get/get.dart';

import '../controllers/choose_city_controller.dart';

class ChooseCityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChooseCityController>(
      () => ChooseCityController(),
    );
  }
}
