import 'package:flutter/material.dart';

class sportScreen extends StatefulWidget {
  const sportScreen({super.key});

  @override
  State<sportScreen> createState() => _sportScreenState();
}

class _sportScreenState extends State<sportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sport News",
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
