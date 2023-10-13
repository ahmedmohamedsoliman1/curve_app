import 'package:get/get.dart';

import '../controllers/login_recovery_code_register_controller.dart';

class LoginRecoveryCodeRegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginRecoveryCodeRegisterController>(
      () => LoginRecoveryCodeRegisterController(),
    );
  }
}
