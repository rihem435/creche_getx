import 'package:app/core/widgets/custom_input_text.dart';
import 'package:flutter/material.dart';
class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nomController = TextEditingController();
  final TextEditingController prenomController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController adresseController = TextEditingController();
  final TextEditingController telephoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30),
                CustomInputText(
                  controller: nomController,
                  hintText: "Enter your first name",
                  icon: Icons.person,
                  text: "First Name",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "First name is required";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                CustomInputText(
                  controller: prenomController,
                  hintText: "Enter your last name",
                  icon: Icons.person_outline,
                  text: "Last Name",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Last name is required";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                CustomInputText(
                  controller: usernameController,
                  hintText: "Enter your username",
                  icon: Icons.account_circle,
                  text: "Username",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Username is required";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                CustomInputText(
                  controller: emailController,
                  hintText: "Enter your email",
                  icon: Icons.email,
                  text: "Email",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Email is required";
                    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return "Invalid email format";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                CustomInputText(
                  controller: passwordController,
                  hintText: "Enter your password",
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
                      return "Password is required";
                    } else if (value.length < 8) {
                      return "Password must be at least 8 characters";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                CustomInputText(
                  controller: adresseController,
                  hintText: "Enter your address",
                  icon: Icons.home,
                  text: "Address",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Address is required";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                CustomInputText(
                  controller: telephoneController,
                  hintText: "Enter your phone number",
                  icon: Icons.phone,
                  text: "Phone Number",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Phone number is required";
                    } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                      return "Invalid phone number";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      print('Valid');
                      print('First Name: ${nomController.text}');
                      print('Last Name: ${prenomController.text}');
                      print('Username: ${usernameController.text}');
                      print('Email: ${emailController.text}');
                      print('Password: ${passwordController.text}');
                      print('Address: ${adresseController.text}');
                      print('Phone Number: ${telephoneController.text}');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  ),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}