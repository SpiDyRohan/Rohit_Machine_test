import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:rohit_machine_test/modules/home_page/controller/home_screen_controller.dart';

class HomeScreen extends GetView<HomeScreeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(Icons.notifications,color: Colors.white,),
          )
        ],
        leading: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Icon(Icons.menu,color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.blueAccent,
            height: 80,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Home",style: TextStyle(
                    fontSize: 25,
                    color: Colors.white
                  ),),
                  Text("Team bedrijfsbureau",style: TextStyle(
                      fontSize: 15,
                      color: Colors.white
                  ),),
                ],
              ),
            ),
          ),
          Obx(() => controller.showLoader.value
              ? Center(
                  child: CupertinoActivityIndicator(
                    radius: 35,
                    color: Colors.amber,
                  ),
                )
              : ListView.builder(
            shrinkWrap: true,
                  itemCount: controller.userslist.value.length,
                  itemBuilder: (context, index) {
                    var usersData=controller.userslist.value[index];
                     return controller.usersCard(usersData);
                  },
                )),
        ],
      ),
    );
  }
}
