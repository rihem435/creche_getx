import 'package:app/core/networking/app_url.dart';
import 'package:app/core/storage/app_storage.dart';
import 'package:app/models/user_login_model.dart';
import 'package:app/screen/home_screen.dart';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import 'package:dio/dio.dart' as di;
class ProfileController extends GetxController {
  final keyForm = GlobalKey<FormState>();

  TextEditingController userNameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final dio = di.Dio();

  UserLoginModel? userLoginModel;

  login(BuildContext context) async {
    try {
      di.Response response = await dio.post(
        AppUrl.loginUrl,
        data: {
          "username": userNameController.text,
          "password": passwordController.text,
        },
      );
      if (response.statusCode == 200) {
        print("login success------------------------");

        userLoginModel = UserLoginModel.fromJson(response.data);

        print("username================>${userLoginModel!.firstName}");

        AppStorage.saveName(
            "${userLoginModel!.firstName}${userLoginModel!.lastName}");

        AppStorage.saveEmail("${userLoginModel!.email}");

        Get.to(const HomeScreen());

        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => const HomeScreen(),
        //   ),
        // );
      }
    } catch (error) {
      print('error==================>$error');
    }
  }

  bool obscureText = true;
  void showPassword() {
    obscureText = !obscureText;
    print("obscureText ==========>$obscureText");
  }
}
