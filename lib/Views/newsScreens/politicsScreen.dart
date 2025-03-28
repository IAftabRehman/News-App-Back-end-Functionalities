import 'package:flutter/material.dart';

class politicsScreen extends StatefulWidget {
  const politicsScreen({super.key});

  @override
  State<politicsScreen> createState() => _politicsScreenState();
}

class _politicsScreenState extends State<politicsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Politics News",
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
