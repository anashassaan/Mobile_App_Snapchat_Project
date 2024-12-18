// import 'package:flutter/material.dart';
// import 'package:project2/utils/colors.dart';
// import 'package:project2/utils/customWidgts.dart';

// class SignupScreen extends StatefulWidget {
//   const SignupScreen({super.key});

//   @override
//   State<SignupScreen> createState() => _SignupScreenState();
// }

// class _SignupScreenState extends State<SignupScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: whiteColor,
//         body: Stack(
//           children: [
//             CenterTextContainer(
//                 tLeft: 102,
//                 tHeight: 243,
//                 cText: "What's your name?",
//                 fSize: 25,
//                 tColor: secondryColor),
//             CenterTextContainer(
//                 tHeight: 292,
//                 tLeft: 56,
//                 cText: "FIRST NAME",
//                 fSize: 15,
//                 tColor: secondryColor),
//             CenterTextContainer(
//                 tHeight: 376,
//                 tLeft: 56,
//                 cText: "LAST NAME",
//                 fSize: 15,
//                 tColor: secondryColor),
//             TextDivider(indent: 57, endIndent: 100, top: 431),
//             CenterTextContainer(
//                 tHeight: 458,
//                 tLeft: 56,
//                 cText:
//                     "By tapping Signup & Accept you acknowledge that \n you read the privcy Policy and agree the \n Terms Services",
//                 fSize: 10,
//                 tColor: brownColor),
//             Center(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 30),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.pushNamed(context, '/signup_bd_screen');
//                           },
//                           child: const ReusableButton(
//                             btnHeight: 50.0,
//                             btnWidth: 210.0,
//                             btnColour: secondryColor,
//                             btnCircularRadius: 80.0,
//                             btnChild: Text(
//                               "Sign Up & Accept",
//                               style: TextStyle(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                   color: whiteColor),
//                             ),
//                           ),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ));
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/utils/colors.dart';
import 'package:project2/utils/customWidgts.dart';

import '../controllers/signup_controller.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SignupController controller = Get.put(SignupController());

    return Scaffold(
      backgroundColor: whiteColor,
      body: Stack(
        children: [
          CenterTextContainer(
            tLeft: 102,
            tHeight: 243,
            cText: "What's your name?",
            fSize: 25,
            tColor: secondryColor,
          ),
          CenterTextContainer(
            tHeight: 292,
            tLeft: 56,
            cText: "FIRST NAME",
            fSize: 15,
            tColor: secondryColor,
          ),
          TextFeild(
            controller: controller.firstNameController,
            hintText: " ",
            fetop: 310,
          ),
          CenterTextContainer(
            tHeight: 376,
            tLeft: 56,
            cText: "LAST NAME",
            fSize: 15,
            tColor: secondryColor,
          ),
          TextFeild(
            controller: controller.lastNameController,
            hintText: "",
            fetop: 390,
          ),
          CenterTextContainer(
            tHeight: 458,
            tLeft: 56,
            cText:
                "By tapping Signup & Accept you acknowledge that \n you read the Privacy Policy and agree to the \n Terms of Service",
            fSize: 10,
            tColor: brownColor,
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
                        onTap: () {
                          Navigator.pushNamed(context, '/signup_bd_screen');
                        },
                        child: const ReusableButton(
                          btnHeight: 50.0,
                          btnWidth: 210.0,
                          btnColour: secondryColor,
                          btnCircularRadius: 80.0,
                          btnChild: Text(
                            "Sign Up & Accept",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: whiteColor,
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
  });

  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final double fetop;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: fetop, left: 56),
      child: SizedBox(
        width: 240,
        child: TextField(
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
        ),
      ),
    );
  }
}
