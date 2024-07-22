import 'package:app/core/bindings.dart';
import 'package:app/screen/home_screen.dart';
import 'package:app/screen/login_screen.dart';
import 'package:app/screen/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

var text = const Text(
  "Bonjour ",
  style: TextStyle(
    color: Colors.blue,
    fontSize: 25,
  ),
);
var afficheIcon = const Icon(
  Icons.email,
  size: 30,
  color: Colors.black,
);

var afficheIconVi = IconButton(
  onPressed: () {
    print('click icon------------------');
  },
  icon: const Icon(
    Icons.visibility,
    color: Colors.blue,
    size: 35,
  ),
);
Future<void> main() async {
  await GetStorage.init();

  runApp(
    GetMaterialApp(
      initialBinding: AllBindings(),
      home: const HomeScreen(),
    ),
  );
}
