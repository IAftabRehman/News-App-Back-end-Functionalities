import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:news_app_backend_functionalities/Views/categories_screen.dart';
import 'package:news_app_backend_functionalities/Views/login_screen.dart';
import 'package:news_app_backend_functionalities/Views/newsScreens/educationScreen.dart';
import 'package:news_app_backend_functionalities/Views/newsScreens/politicsScreen.dart';
import 'package:news_app_backend_functionalities/Views/newsScreens/sportsScreen.dart';
import 'package:news_app_backend_functionalities/Views/newsScreens/technologyScreen.dart';
import 'package:news_app_backend_functionalities/Views/newsScreens/worldnewsScreen.dart';
import 'package:news_app_backend_functionalities/Views/selectArea_screen.dart';
import 'package:news_app_backend_functionalities/Views/selectCity_screen.dart';
import 'package:news_app_backend_functionalities/Views/selectCountry_screen.dart';
import 'package:news_app_backend_functionalities/Views/signUp_screen.dart';

import 'Views/forgetPassword_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: categories_screen(),
    );
  }
}

