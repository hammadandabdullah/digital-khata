import 'package:digital_khata/screens/login_screen.dart';
import 'package:digital_khata/screens/you_gave_screen.dart';
import 'package:flutter/material.dart';
import 'screens/add_contact_screen.dart';
import 'screens/you_got_screen.dart';
import 'screens/contact_screen.dart';
import 'screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digital Khata',
      theme: ThemeData.dark(),
      initialRoute: LoginScreen.id,
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        AddContact.id: (context) => AddContact(),
        ContactScreen.id: (context) => ContactScreen(),
        LoginScreen.id: (context) => LoginScreen(),
      },
    );
  }
}
