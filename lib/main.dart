import 'package:booking_gym/pages/signUp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:booking_gym/pages/home.dart';
import 'package:booking_gym/pages/login.dart';
import 'package:booking_gym/pages/profile.dart';
//import 'package:booking_gym/flutter_icons.dart'; // importer cette ligne

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const Color _blueColor = Colors.blue;
  static const Color _redColor = Colors.red;
  static const Color _greenColor = Colors.green;

  int _currentIndex = 0;

  void setCurrentIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

@override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: [const SignUpPage(), const LoginPage(), const ProfilePage()][_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: setCurrentIndex,
          type: BottomNavigationBarType.fixed,
          iconSize: 32,
          elevation: 10,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: _blueColor),
              label: 'Accueil',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.login, color: _redColor),
              label: 'Connexion',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: _greenColor), // utiliser 'person' au lieu de 'profile'
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}