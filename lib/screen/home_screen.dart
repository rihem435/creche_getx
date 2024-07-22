import 'package:app/controllers/home_controller.dart';
import 'package:app/core/storage/app_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.getChildrenByParent();
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
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              // <-- SEE HERE
              decoration: const BoxDecoration(color: Colors.grey),

              accountName: Text(
                "${AppStorage.readName()}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

              accountEmail: Text(
                "${AppStorage.readEmail()}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

              currentAccountPicture: Image.asset(
                "assets/images/parent.png",
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
              ),
              title: const Text('Page 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.train,
              ),
              title: const Text('Page 2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SizedBox(
              // color: Colors.grey,
              height: double.infinity,
              width: double.infinity,
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(20),
                    width: 300,
                    child: const ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage("assets/images/enfant.jpg"),
                        radius: 25,
                      ),
                      title: Text(
                        "Mohamed Aziz",
                      ),
                      trailing: Text(
                        "Present",
                      ),
                    ),
                  );
                },
                itemCount: 5,
                scrollDirection: Axis.horizontal,
              ),
            ),
          )
        ],
      ),
    );
  }
}
