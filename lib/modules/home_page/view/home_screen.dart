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
          Icon(Icons.notifications)
        ],
        leading: Icon(Icons.menu),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.blueAccent,
            height: 150,
            child: Column(
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
          Obx(() => controller.showLoader.value
              ? Center(
                  child: CupertinoActivityIndicator(
                    radius: 35,
                    color: Colors.amber,
                  ),
                )
              : ListView.builder(
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
