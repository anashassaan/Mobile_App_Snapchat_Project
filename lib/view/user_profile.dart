import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project2/utils/colors.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                CircleAvatar(
                  radius: 50,
                  child: Stack(children: [
                    Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Icon(
                        Icons.account_circle_outlined,
                        size: 90,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.add,
                        ),
                      ),
                    ),
                  ]),
                ),
                SizedBox(height: 10),
                Text(
                  'jenny98.12',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Snap Score: 45,325', // replace with actual snap score
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Sync contacts for adding friends
                  },
                  style: ElevatedButton.styleFrom(
                    shadowColor: blackColor,
                    backgroundColor: Color(0xFF0EAEFE),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                  child: Text(
                    'Find Friends',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Divider(),
                ListTile(
                  leading: Icon(
                    Icons.add_circle_outline,
                  ),
                  title: Text('Add to My Story'),
                  onTap: () {
                    // Navigate to add to My Story
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.add_circle_outline,
                  ),
                  title: Text('Add to Our Story'),
                  onTap: () {
                    // Navigate to add to Our Story
                  },
                ),
                Divider(),
                ListTile(
                  leading: Icon(
                    Icons.person_add_alt_1_outlined,
                  ),
                  title: Text('Add Friends'),
                  onTap: () {
                    // Navigate to add friends
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.group_outlined,
                  ),
                  title: Text('My Friends'),
                  onTap: () {
                    // Navigate to My Friends
                  },
                ),
                Divider(),
                ListTile(
                  leading: Icon(
                    Icons.change_history,
                  ),
                  title: Text('Change My Outfit'),
                  onTap: () {
                    // Navigate to change Bitmoji outfit
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.edit,
                  ),
                  title: Text('Edit My Bitmoji'),
                  onTap: () {
                    // Navigate to edit Bitmoji
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    await _signOut(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF0EAEFE),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                  child: Text(
                    'Log Out',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pushNamed(context, '/initial_screen');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to sign out: $e'),
        ),
      );
    }
  }
}
