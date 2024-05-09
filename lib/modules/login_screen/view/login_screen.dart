import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:rohit_machine_test/modules/login_screen/controller/login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "InLoggen",
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
            Text(
              "Log in met uw inloggegevens",
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
            Text(
              "Gebruikersnaam",
              style: TextStyle(color: Colors.amber, fontSize: 15),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.amber)),
              child: TextFormField(
                controller: controller.emailController,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            Text(
              "Wachtwoord",
              style: TextStyle(color: Colors.amber, fontSize: 15),
            ),
            Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.amber)),
                child: Obx(
                  () => TextFormField(
                    obscureText: controller.obsecurePass.value,
                    controller: controller.passwordController,
                    decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                            onTap: () {
                              controller.obsecurePass.value =
                                  !controller.obsecurePass.value;
                            },
                            child: Icon(Icons.remove_red_eye)),
                        border: InputBorder.none),
                  ),
                )),
            Text(
              "Wachtwoord vergeten??",
              style: TextStyle(
                color: Colors.black,
                decoration: TextDecoration.underline,
              ),
            ),
            Obx(() => controller.showLoader.value?CupertinoActivityIndicator(
              color: Colors.amber,
              radius: 30,
            ): GestureDetector(
              onTap: () {
                if(controller.passwordController.text!="" && controller.emailController.text!=""){
                  final bool isValid = EmailValidator.validate(controller.emailController.text);
                  if(isValid){
                      controller.loginApi();
                  }else{
                    Get.snackbar("Required", "Email is not valid",backgroundColor: Colors.red,colorText: Colors.white);
                  }
                }else{
                  Get.snackbar("Required", "Please Enter Credentials",backgroundColor: Colors.red,colorText: Colors.white);
                }
              },
              child: Container(
                height: 50,
                width: Get.width,
                decoration: BoxDecoration(
                    color: Colors.amber, borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "InLoggen",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
