import 'package:flutter/material.dart';
// import 'package:project/Intial_Screen.dart';
import 'package:project2/utils/colors.dart';
import 'package:project2/utils/customWidgts.dart';

//Constants

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  _InitialScreenState createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 180,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assests/Icons/snapchat.png"))),
              ),
            ],
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
                          Navigator.pushNamed(context, '/login_screen');
                        },
                        child: const ReusableButton(
                          btnHeight: 36.0,
                          btnWidth: 128.0,
                          btnColour: whiteColor,
                          btnCircularRadius: 80.0,
                          btnChild: Text(
                            "Log in",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/signup_screen');
                        },
                        child: const ReusableButton(
                          btnHeight: 36.0,
                          btnWidth: 128.0,
                          btnColour: secondryColor,
                          btnCircularRadius: 80.0,
                          btnChild: Text(
                            "Sign Up",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
