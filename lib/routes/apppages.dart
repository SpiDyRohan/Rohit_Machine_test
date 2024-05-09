import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:rohit_machine_test/modules/home_page/binding/home_screen_binding.dart';
import 'package:rohit_machine_test/modules/home_page/view/home_screen.dart';
import 'package:rohit_machine_test/modules/login_screen/bindings/login_binding.dart';
import 'package:rohit_machine_test/modules/login_screen/view/login_screen.dart';
import 'package:rohit_machine_test/routes/app_routes.dart';

class AppPages{
  static const String initialRoute=AppRoutes.login;
  static List<GetPage<dynamic>> pages=[

    GetPage(name: AppRoutes.login, page: () => LoginScreen(),binding: LoginBinding()),
    GetPage(name: AppRoutes.homePage, page: () => HomeScreen(),binding: HomeScreenBinding()),
  ];

}