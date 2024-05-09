import 'package:get/get.dart';
import 'package:rohit_machine_test/modules/login_screen/controller/login_controller.dart';

class LoginBinding extends Bindings{
  @override
  void dependencies() {
   Get.put(LoginController());
  }

}