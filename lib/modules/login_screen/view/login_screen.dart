import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:rohit_machine_test/modules/login_screen/controller/login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30,),
                Text(
                  "InLoggen",
                  style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: 10,),
                Text(
                  "Log in met uw inloggegevens",
                  style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal, fontSize: 13),
                ),
                SizedBox(height: 30,),
                Obx(() => Text(
                  "Gebruikersnaam",
                  style: TextStyle(color: controller.emailEmpty.value?Colors.black:Colors.amber, fontSize: 15),
                )),
                SizedBox(height: 10,),
                Obx(() => Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1, color:  controller.emailEmpty.value?Colors.black: Colors.amber)),
                  child: TextFormField(
                    controller: controller.emailController,
                    decoration: InputDecoration(border: InputBorder.none,contentPadding: EdgeInsets.only(left: 10)),
                    onChanged: (value) {
                      if(controller.emailController.text.isEmpty){
                        controller.emailEmpty.value=true;
                      }else{
                        controller.emailEmpty.value=false;
                      }
                    },
                  ),
                ),),
                SizedBox(height: 30,),
                Obx(() => Text(
                  "Wachtwoord",
                  style: TextStyle(color:  controller.passEmpty.value?Colors.black: Colors.amber, fontSize: 15),
                )),
                SizedBox(height: 10,),
                Obx(() => Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),

                        border: Border.all(width: 1, color:controller.passEmpty.value?Colors.black:  Colors.amber)),
                    child: Obx(
                          () => TextFormField(
                        obscureText: controller.obsecurePass.value,
                        controller: controller.passwordController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10,top: 10),
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  controller.obsecurePass.value =
                                  !controller.obsecurePass.value;
                                },
                                child: Icon(Icons.remove_red_eye)),
                            border: InputBorder.none),
                        onChanged: (value) {
                          if(controller.passwordController.text.isEmpty){
                            controller.passEmpty.value=true;
                          }else{
                            controller.passEmpty.value=false;
                          }
                        },
                      ),

                    ))),
                SizedBox(height: 30,),
                Text(
                  "Wachtwoord vergeten??",
                  style: TextStyle(
                    color: Colors.black,
                    decoration: TextDecoration.underline,
                  ),
                ),
                SizedBox(height: 30,),
                Obx(() =>
                controller.showLoader.value?Center(
                  child: CupertinoActivityIndicator(
                    color: Colors.amber,
                    radius: 30,
                  ),
                ): GestureDetector(
                  onTap: () {
                    if(controller.passwordController.text!="" && controller.emailController.text!=""){
                      final bool isValid = EmailValidator.validate(controller.emailController.text);
                      if(isValid){
                        FocusManager.instance.primaryFocus!.unfocus();
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
                    child: Center(
                      child: Text(
                        "InLoggen",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
