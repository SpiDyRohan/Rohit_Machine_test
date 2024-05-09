import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:rohit_machine_test/networking/api_client.dart';
import 'package:rohit_machine_test/routes/app_routes.dart';

class LoginController extends GetxController{
  var obsecurePass=false.obs;
  var showLoader=false.obs;
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();


  void loginApi() async {
    showLoader.value=true;
    Dio dio =Dio();
    dio.interceptors.add(PrettyDioLogger());
    var client =ApiClient(dio);
    await client.loginAPi().then((value) {
      showLoader.value=false;
      Get.toNamed(AppRoutes.homePage);

    }).onError((error, stackTrace) {
      showLoader.value=false;
    });
  }
}