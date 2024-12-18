// import 'package:flutter/material.dart';
// import 'package:project2/utils/colors.dart';
// import 'package:project2/utils/customWidgts.dart';

// class SignupBdScreen extends StatelessWidget {
//   const SignupBdScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: whiteColor,
//         body: Stack(
//           children: [
//             CenterTextContainer(
//                 tLeft: 70,
//                 tHeight: 243,
//                 cText: "What's your birthday?",
//                 fSize: 25,
//                 tColor: secondryColor),
//             CenterTextContainer(
//                 tHeight: 292,
//                 tLeft: 56,
//                 cText: "BIRTHDAY",
//                 fSize: 15,
//                 tColor: secondryColor),
//             TextDivider(indent: 57, endIndent: 100, top: 352),
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
//                             Navigator.pushNamed(context, '/getstarted_screen');
//                           },
//                           child: const Padding(
//                             padding: EdgeInsets.only(top: 200),
//                             child: ReusableButton(
//                               btnHeight: 58.0,
//                               btnWidth: 210.0,
//                               btnColour: secondryColor,
//                               btnCircularRadius: 80.0,
//                               btnChild: Text(
//                                 "Continue",
//                                 style: TextStyle(
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.bold,
//                                     color: whiteColor),
//                               ),
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

class SignupBdScreen extends StatelessWidget {
  const SignupBdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SignupController controller = Get.put(SignupController());

    return Scaffold(
      backgroundColor: whiteColor,
      body: Stack(
        children: [
          CenterTextContainer(
            tLeft: 70,
            tHeight: 243,
            cText: "What's your birthday?",
            fSize: 25,
            tColor: secondryColor,
          ),
          CenterTextContainer(
            tHeight: 292,
            tLeft: 56,
            cText: "BIRTHDAY",
            fSize: 15,
            tColor: secondryColor,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 0, top: 310),
            child: Obx(() => TextFeild(
                  controller: TextEditingController(
                      text: controller.selectedDate.value
                          .toLocal()
                          .toString()
                          .split(' ')[0]),
                  hintText: "Select your birthday",
                  obscureText: false,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 56, top: 440),
            child: SizedBox(
              width: 275,
              height: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 150,
                      child: ListWheelScrollView.useDelegate(
                        itemExtent: 40,
                        onSelectedItemChanged: (index) {
                          controller.updateMonth(index + 1);
                        },
                        childDelegate: ListWheelChildBuilderDelegate(
                          builder: (context, index) {
                            return Center(
                              child: Text(
                                DateTime(0, index + 1)
                                    .month
                                    .toString()
                                    .padLeft(2, '0'),
                                style: TextStyle(
                                  color: index + 1 ==
                                          controller.selectedDate.value.month
                                      ? Colors.black
                                      : Colors.grey,
                                  fontSize: 18,
                                ),
                              ),
                            );
                          },
                          childCount: 12,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 150,
                      child: ListWheelScrollView.useDelegate(
                        itemExtent: 40,
                        onSelectedItemChanged: (index) {
                          controller.updateDay(index + 1);
                        },
                        childDelegate: ListWheelChildBuilderDelegate(
                          builder: (context, index) {
                            return Center(
                              child: Text(
                                (index + 1).toString().padLeft(2, '0'),
                                style: TextStyle(
                                  color: index + 1 ==
                                          controller.selectedDate.value.day
                                      ? Colors.black
                                      : Colors.grey,
                                  fontSize: 18,
                                ),
                              ),
                            );
                          },
                          childCount: 31,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 150,
                      child: ListWheelScrollView.useDelegate(
                        itemExtent: 40,
                        onSelectedItemChanged: (index) {
                          controller.updateYear(2000 + index);
                        },
                        childDelegate: ListWheelChildBuilderDelegate(
                          builder: (context, index) {
                            return Center(
                              child: Text(
                                (2000 + index).toString(),
                                style: TextStyle(
                                  color: 2000 + index ==
                                          controller.selectedDate.value.year
                                      ? Colors.black
                                      : Colors.grey,
                                  fontSize: 18,
                                ),
                              ),
                            );
                          },
                          childCount: 100,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
                          Navigator.pushNamed(context, '/signUp_email');
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(top: 200),
                          child: ReusableButton(
                            btnHeight: 58.0,
                            btnWidth: 210.0,
                            btnColour: secondryColor,
                            btnCircularRadius: 80.0,
                            btnChild: Text(
                              "Continue",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: whiteColor,
                              ),
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
    this.obscureText = false,
  });

  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 56),
      child: SizedBox(
        width: double.infinity,
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
