import 'package:flutter/material.dart';
import 'package:project2/utils/customWidgts.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const App_emoji_search(inputText: "Location"),
          Padding(
            padding: const EdgeInsets.only(top: 35),
            child: Container(
              height: 688,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assests/Images/location.jpeg"))),
            ),
          ),
        ],
      ),
    );
  }
}
