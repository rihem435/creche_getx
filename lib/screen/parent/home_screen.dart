import 'package:app/controllers/home_controller.dart';
import 'package:app/core/networking/app_url.dart';
import 'package:app/core/storage/app_storage.dart';
import 'package:app/screen/parent/details_enfant_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Mes enfants",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.grey[800]),
              accountName: Text(
                "${AppStorage.readName()}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              accountEmail: Text(
                "${AppStorage.readEmail()}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white70,
                ),
              ),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage("assets/images/parent.png"),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.blue),
              title: const Text(
                'Home',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.blue),
              title: const Text(
                'Settings',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text(
                'Logout',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                // Implement your logout functionality here
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.grey,
              child: FutureBuilder(
                future: controller.getChildrenByParent("${AppUrl.getEnfantsByIdParentUrl}${AppStorage.readId()}"),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    if (snapshot.hasData) {
                      if (snapshot.data!.isNotEmpty) {
                        return ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.listChildrenModel!.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              child: Container(
                                padding: const EdgeInsets.all(20),
                                color: Colors.grey,
                                width: 300,
                                child: ListTile(
                                  leading: const CircleAvatar(
                                    backgroundImage:
                                        AssetImage("assets/images/child.jpeg"),
                                    radius: 25,
                                  ),
                                  title: Text(
                                      "${controller.listChildrenModel![index].prenom!}${controller.listChildrenModel![index].nom!}"),
                                  trailing: const Text("Present"),
                                ),
                              ),
                              onTap: () {
                                Get.to(
                                  DetailsEnfantScreen(
                                    nomEnfant: controller
                                        .listChildrenModel![index].nom!,
                                    prenomEnfant: controller
                                        .listChildrenModel![index].prenom!,
                                    ageEnfant: controller
                                        .listChildrenModel![index].age!,
                                    comportementEnfant: controller
                                        .listChildrenModel![index]
                                        .comportement!,
                                  ),
                                );
                              },
                            );
                          },
                        );
                      } else {
                        return Center(
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/images/no_data.jpg",
                                width: 300,
                                height: 200,
                              ),
                              const Text("No Children"),
                            ],
                          ),
                        );
                      }
                    } else {
                      return Center(
                        child: Column(
                          children: [
                            Image.asset(
                              "",
                              width: 300,
                              height: 200,
                            ),
                            const Text("No Children"),
                          ],
                        ),
                      );
                    }
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
