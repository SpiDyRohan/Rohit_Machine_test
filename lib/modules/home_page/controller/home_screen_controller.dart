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
     height: 80,
     padding: EdgeInsets.symmetric(horizontal: 10),
     margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
     decoration: BoxDecoration(
       color: Colors.blue,
       borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
     ),
     child: Row(
       children: [
         CircleAvatar(backgroundImage: NetworkImage(usersData.avatar!),radius: 30,),
         // Image.network(usersData.avatar!),
         Padding(
           padding: const EdgeInsets.all(10),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text(usersData.first_name!+" "+usersData.last_name!,style: TextStyle(
                 color: Colors.white
               ),),
               Text(usersData.email!,style: TextStyle(
                   color: Colors.white
               ),),
             ],
           ),
         ),
       ],
     ),
   );
  }
}