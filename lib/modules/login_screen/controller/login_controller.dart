import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:rohit_machine_test/networking/api_client.dart';
import 'package:rohit_machine_test/routes/app_routes.dart';

class LoginController extends GetxController{
  var obsecurePass=false.obs;
  var showLoader=false.obs;
  var emailEmpty=true.obs;
  var passEmpty=true.obs;
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
   @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    emailController.text="eve.holt@reqres.in";
    passwordController.text="cityslicka";
  }

  void loginApi() async {
    showLoader.value=true;
    Dio dio =Dio();
    dio.interceptors.add(PrettyDioLogger());
    var body ={
      "email": emailController.text,
      "password": passwordController.text
    };
    var client =ApiClient(dio);
    await client.loginAPi(body).then((value) {
      showLoader.value=false;
      print("Succes ${value}");
      Get.toNamed(AppRoutes.homePage);
    }).onError((error, stackTrace) {
      print("Error ${error}");
      showLoader.value=false;
      Get.snackbar("Error", "Invalid Credentials",backgroundColor: Colors.red,colorText: Colors.white);
    });
  }
}