import 'package:flutter/material.dart';
import 'package:project2/utils/colors.dart';
import 'package:project2/view/camra_screen.dart';
import 'package:project2/view/chat.dart';
import 'package:project2/view/location_screen.dart';
import 'package:project2/view/stories.dart';
import 'package:project2/view/videos.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 2;

  static final List<Widget> _widgetOptions = <Widget>[
    const LocationScreen(),
    ChatScreen(),
    const CamraScreen(),
    const StoriesScreen(),
    const VideoScreen(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: brownColor,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: SizedBox(
        height: 58,
        // decoration: BoxDecoration(color: Colors.black54),
        child: BottomNavigationBar(
          backgroundColor: Colors.red,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.location_on_outlined,
                // color: Colors.black38,
              ),
              label: ' ',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline),
              label: ' ',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt_outlined),
              label: ' ',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.group),
              label: ' ',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.play_arrow),
              label: ' ',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
