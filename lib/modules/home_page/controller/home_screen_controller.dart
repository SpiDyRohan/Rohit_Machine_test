import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:rohit_machine_test/response_model/users_response/users_response.dart';

import '../../../networking/api_client.dart';

class HomeScreeController extends GetxController{
 var showLoader=false.obs;
 RxList<UsersData> userslist = <UsersData>[].obs;
 @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    usersApi();
  }


  void usersApi() async {
    showLoader.value=true;
    Dio dio =Dio();
    dio.interceptors.add(PrettyDioLogger());
    var client =ApiClient(dio);
    await client.usersAPi().then((value) {
      showLoader.value=false;
      userslist.value=value.data!;

    }).onError((error, stackTrace) {
      showLoader.value=false;
    });
  }
  Widget usersCard(UsersData usersData){
   return Container(
     height: 200,
     decoration: BoxDecoration(
       color: Colors.white,
       borderRadius: BorderRadius.circular(15),
     ),
     child: Column(
       children: [
         Container(
           height: 50,
           color: Colors.blue,
           child: Row(
             children: [
               Image.network(usersData.avatar!),
               Column(
                 children: [
                   Text(usersData.first_name!+" "+usersData.last_name!),
                   Text(usersData.email!),
                 ],
               ),
             ],
           ),
         )
       ],
     ),
   );
  }
}