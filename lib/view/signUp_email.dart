import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/controllers/signup_controller.dart';
import 'package:project2/utils/colors.dart';
import 'package:project2/utils/customWidgts.dart';
import 'package:project2/utils/utils.dart';

class SignupEmail extends StatelessWidget {
  const SignupEmail({super.key});

  @override
  Widget build(BuildContext context) {
    final SignupController controller = Get.put(SignupController());
    final FirebaseAuth _auth = FirebaseAuth.instance;

    return Scaffold(
      backgroundColor: whiteColor,
      body: Form(
        key: controller.formKey,
        child: Stack(
          children: [
            CenterTextContainer(
              tLeft: 158,
              tHeight: 232,
              cText: "Sign Up",
              fSize: 30,
              tColor: blackColor,
            ),
            CenterTextContainer(
              tHeight: 292,
              tLeft: 56,
              cText: "EMAIL",
              fSize: 15,
              tColor: secondryColor,
            ),
            TextFeild(
              controller: controller.emailController,
              hintText: " ",
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
              cText: "CREATE PASSWORD",
              fSize: 15,
              tColor: secondryColor,
            ),
            TextFeild(
              controller: controller.passwordController,
              hintText: " ",
              obscureText: true,
              fetop: 390,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                if (value.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                return null;
              },
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
                          onTap: () async {
                            if (controller.formKey.currentState!.validate()) {
                              try {
                                await _auth.createUserWithEmailAndPassword(
                                  email: controller.emailController.text
                                      .toString(),
                                  password: controller.passwordController.text
                                      .toString(),
                                );
                                Navigator.pushNamed(
                                    context, '/getstarted_screen');
                              } catch (error) {
                                Utils().toastMassage(error.toString());
                              }
                            }
                          },
                          child: const ReusableButton(
                            btnHeight: 50.0,
                            btnWidth: 210.0,
                            btnColour: secondryColor,
                            btnCircularRadius: 80.0,
                            btnChild: Text(
                              "Sign Up",
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
