import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/utils/colors.dart';
import 'package:project2/utils/customWidgts.dart';
import '../controllers/login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());

    return Scaffold(
      backgroundColor: whiteColor,
      body: Form(
        key: controller.formKey,
        child: Stack(
          children: [
            CenterTextContainer(
              tLeft: 158,
              tHeight: 232,
              cText: "Log In",
              fSize: 30,
              tColor: blackColor,
            ),
            CenterTextContainer(
              tHeight: 292,
              tLeft: 56,
              cText: "USERNAME OR EMAIL",
              fSize: 15,
              tColor: secondryColor,
            ),
            TextFeild(
              controller: controller.emailController,
              hintText: "  ",
              fetop: 310,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
            CenterTextContainer(
              tHeight: 376,
              tLeft: 56,
              cText: "PASSWORD",
              fSize: 15,
              tColor: secondryColor,
            ),
            TextFeild(
              controller: controller.passwordController,
              hintText: "  ",
              obscureText: true,
              fetop: 390,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            CenterTextContainer(
              tHeight: 458,
              tLeft: 131,
              cText: "Forgot Your Password?",
              fSize: 15,
              tColor: secondryColor,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: controller.login,
                          child: const ReusableButton(
                            btnHeight: 50.0,
                            btnWidth: 210.0,
                            btnColour: secondryColor,
                            btnCircularRadius: 80.0,
                            btnChild: Text(
                              "Log in",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextFeild extends StatelessWidget {
  const TextFeild({
    super.key,
    required this.controller,
    required this.hintText,
    required this.fetop,
    this.obscureText = false,
    required this.validator,
  });

  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final double fetop;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: fetop, left: 56),
      child: SizedBox(
        width: 240,
        child: TextFormField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hintText,
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 2.0),
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1.0),
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 10),
          ),
          validator: validator,
        ),
      ),
    );
  }
}
