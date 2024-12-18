import 'package:flutter/material.dart';
import 'package:project2/utils/colors.dart';
import 'package:project2/utils/customWidgts.dart';

class GetstartedScreen extends StatelessWidget {
  const GetstartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor,
        body: Stack(
          children: [
            CenterTextContainer(
                tLeft: 130,
                tHeight: 139,
                cText: "Get Started",
                fSize: 25,
                tColor: blackColor),
            CenterTextContainer(
                tHeight: 172,
                tLeft: 96,
                cText: "Enable app permission to\n make signup easy",
                fSize: 18,
                tColor: brownColor),
            CenterTextContainer(
                tHeight: 539,
                tLeft: 112,
                cText: "Tap Allow when prompet",
                fSize: 12,
                tColor: brownColor),
            Padding(
              padding: const EdgeInsets.only(
                left: 90,
                top: 328,
              ),
              child: Container(
                height: 211,
                width: 221,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assests/Icons/get_started.png"))),
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
                            Navigator.pushNamed(context, '/home_screen');
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
                                    color: whiteColor),
                              ),
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
        ));
  }
}
