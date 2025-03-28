import 'package:flutter/material.dart';

class educationScreen extends StatefulWidget {
  const educationScreen({super.key});

  @override
  State<educationScreen> createState() => _educationScreenState();
}

class _educationScreenState extends State<educationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Education News",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 10,
        shadowColor: Colors.blue,
      ),
    );
  }
}
