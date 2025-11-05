import 'package:flutter/material.dart';
import 'Screens/Welcome/welcome_screen.dart';
import 'Screens/home_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart'; // <- GENERATED FILE

import 'constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase with generated options
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SharedPreferences preferences = await SharedPreferences.getInstance();
  var email = preferences.getString('email');

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: kPrimaryColor,
      scaffoldBackgroundColor: Colors.white,
    ),
    home: email == null ? WelcomeScreen() : HomePage(),
  ));
}
