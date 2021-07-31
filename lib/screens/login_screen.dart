import 'package:digital_khata/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

String email = '';
String password = '';

List<String> jokes = [
  'HAHAHA',
  'BHOOL GIA PASSWORD?',
  'ITNI ASANI SE NAI JANY DOON GA BACHUUU',
  'PASSWORD: 123456',
  'PASSWORD: 123456',
  'HAHAHAHAHAHAHAHAHA',
  'CAMERY ME DEKH KY HATH HILA DEIN... PRANK HOO GIA HY APP KY SATH',
  'PASSWORD: 345678',
  'HAHAHAHAHAA.. MAZA AYA?',
  'EMAIL: hammad@gmail.com \nPASSWORD: 234567',
];
int currentJoke = 0;

class LoginScreen extends StatefulWidget {
  static String id = 'loginscreen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Digital Khata',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
              Row(
                children: [
                  Text(
                    'New here?',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      _showToast(
                          context,
                          'Just put: \n'
                          'Email: hammad@gmail.com \n'
                          'Password: 0987654321 \n'
                          'YOU BAFOOONN');
                    },
                    child: Text(
                      'Create Account',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Email',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (newValue) {
                  email = newValue;
                },
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Password',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      _showToast(context,
                          'Relax and try to remember your password. Thank me later');
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              TextField(
                obscureText: true,
                onChanged: (newValue) {
                  password = newValue;
                },
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  try {
                    final newUser = await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: email, password: password);

                    if (newUser != null)
                      Navigator.pushNamed(context, HomeScreen.id);
                  } catch (e) {
                    _showToast(context, jokes[currentJoke]);
                    if (currentJoke < jokes.length - 1) currentJoke++;

                    print(e);
                  }
                },
                child: Text('Sign in'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

void _showToast(BuildContext context, String message) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: Text(message),
      action: SnackBarAction(
          label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
    ),
  );
}
