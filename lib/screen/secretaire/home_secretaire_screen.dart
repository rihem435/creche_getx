import 'package:app/controllers/home_controller.dart';
import 'package:app/core/networking/app_url.dart';
import 'package:app/core/storage/app_storage.dart';
import 'package:app/screen/parent/details_enfant_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class HomeSecretaireScreen extends GetView<HomeController> {
  const HomeSecretaireScreen({Key? key}) : super(key: key);

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
                future:
                    controller.getChildrenByParent("${AppUrl.getEnfantsUrl}"),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    if (snapshot.hasData) {
                      if (snapshot.data!.isNotEmpty) {
                        return Slidable(
                            // Specify a key if the Slidable is dismissible.
                            key: const ValueKey(0),

                            // The start action pane is the one at the left or the top side.
                            startActionPane: ActionPane(
                              // A motion is a widget used to control how the pane animates.
                              motion: ScrollMotion(),

                              // A pane can dismiss the Slidable.
                              dismissible: DismissiblePane(onDismissed: () {}),

                              // All actions are defined in the children parameter.
                              children: [
                                // A SlidableAction can have an icon and/or a label.
                                SlidableAction(
                                  onPressed: (context) {
                                    print('Action button pressed');
                                  },
                                  backgroundColor: Color(0xFFFE4A49),
                                  foregroundColor: Colors.white,
                                  icon: Icons.delete,
                                  label: 'Delete',
                                ),
                              ],
                            ),

                            // The end action pane is the one at the right or the bottom side.
                            endActionPane: ActionPane(
                              motion: ScrollMotion(),
                              children: [
                                SlidableAction(
                                  // An action can be bigger than the others.
                                  flex: 2,
                                  onPressed: (context) {},
                                  backgroundColor: Color(0xFF7BC043),
                                  foregroundColor: Colors.white,
                                  icon: Icons.archive,
                                  label: 'Update',
                                ),
                              ],
                            ),

                            // The child of the Slidable is what the user sees when the
                            // component is not dragged.
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: controller.listChildrenModel!.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  child: Container(
                                    padding: const EdgeInsets.all(20),
                                    color: Colors.grey,
                                    width: 300,
                                    child: ListTile(
                                      leading: const CircleAvatar(
                                        backgroundImage: AssetImage(
                                            "assets/images/child.jpeg"),
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
                            ));
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
