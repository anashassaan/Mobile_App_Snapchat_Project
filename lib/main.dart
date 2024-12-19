import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:project2/view/camra_screen.dart';
import 'package:project2/view/chat.dart';
import 'package:project2/view/getstarted_screen.dart';
import 'package:project2/view/home_screen.dart';
import 'package:project2/view/intial_Screen.dart';
import 'package:project2/view/location_screen.dart';
import 'package:project2/view/login_screen.dart';
import 'package:project2/view/signUp_email.dart';
import 'package:project2/view/signup_bd_screen.dart';
import 'package:project2/view/signup_screen.dart';
import 'package:project2/view/stories.dart';
import 'package:project2/view/splash_screen.dart';
import 'package:project2/view/user_profile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const SnapchatApp());
}

class SnapchatApp extends StatelessWidget {
  const SnapchatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF838486),
      ),
      initialRoute: '/splash_screen',
      routes: {
        '/splash_screen': (context) => const SplashScreen(),
        '/initial_screen': (context) => const InitialScreen(),
        '/login_screen': (context) => const LoginScreen(),
        '/signup_screen': (context) => const SignupScreen(),
        '/signup_bd_screen': (context) => const SignupBdScreen(),
        '/getstarted_screen': (context) => const GetstartedScreen(),
        '/home_screen': (context) => const HomeScreen(),
        '/location_screen': (context) => const LocationScreen(),
        '/chat': (context) => ChatScreen(),
        '/camra_screen': (context) => const CamraScreen(),
        '/stories': (context) => const StoriesScreen(),
        '/videos': (context) => const LocationScreen(),
        '/signUp_email': (context) => const SignupEmail(),
        '/user_profile': (context) => const UserProfile(),
      },
    );
  }
}










// 176711649d13920456b73669c47a338be2f4837cf18ed55bb46da3e32f212ca2cfcb7b49c46ae3f5   API KEY




// IconButton(
//           onPressed: () async {
//             await _signOut(context);
//           },
//           icon: const Icon(Icons.logout),
//         ),

// Future<void> _signOut(BuildContext context) async {
//     try {
//       await FirebaseAuth.instance.signOut();
//       Navigator.pushNamed(context, '/initial_screen');
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Failed to sign out: $e'),
//         ),
//       );
//     }
//   }