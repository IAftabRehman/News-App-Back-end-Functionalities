import 'package:flutter/material.dart';

class technology_Screen extends StatefulWidget {
  const technology_Screen({super.key});

  @override
  State<technology_Screen> createState() => _technology_ScreenState();
}

class _technology_ScreenState extends State<technology_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Technology News",
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
