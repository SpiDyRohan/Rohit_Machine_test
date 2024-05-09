import 'package:get/get.dart';
import 'package:rohit_machine_test/modules/home_page/controller/home_screen_controller.dart';

class HomeScreenBinding extends Bindings{
  @override
  void dependencies() {
   Get.put(HomeScreeController());
  }

}