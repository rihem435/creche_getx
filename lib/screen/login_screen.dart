import 'package:app/core/networking/app_url.dart';
import 'package:app/core/widgets/custom_input_text.dart';
import 'package:app/screen/sign_up_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final keyForm = GlobalKey<FormState>();

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  
  final dio = Dio();
  
  login() async {
    try {
      Response response = await dio.post(
        AppUrl.loginUrl,
        data: {
          "username": userNameController.text,
          "password": passwordController.text,
        },
      );
      if (response.statusCode == 200) {
        print("login success------------------------");
      }
    } catch (error) {
      print('error==================>$error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: keyForm,
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Image.asset(
                  "assets/images/img_creche.png",
                  width: 200,
                  height: 200,
                ),
                TextFormField(
                  controller: userNameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "username is required";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    label: Text(
                      "UserName",
                    ),
                    hintText: "tapez votre username",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.blue,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomInputText(
                  controller: passwordController,
                  hintText: "tapez votre password",
                  icon: Icons.lock,
                  obscureText: true,
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.visibility,
                      color: Colors.blue,
                    ),
                  ),
                  text: "Password",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return " username is required";
                    } else if (value.length < 6) {
                      return " password not valid ";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 35,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 18),
                      textStyle: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold)),
                  onPressed: () {
                    if (keyForm.currentState!.validate()) {
                      login();
                      print('valide ');
                      print('username==================>$userNameController');
                      print(
                          'username text===============>${userNameController.text}');
                    }
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text.rich(
                  TextSpan(
                    text: "Don't have an account? ",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                    children: [
                      TextSpan(
                        text: "SignUp",
                        style: const TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => SignUpScreen(),
                                ),
                              ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
