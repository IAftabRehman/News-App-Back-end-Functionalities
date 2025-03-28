import 'package:flutter/material.dart';

class worldnewsScreen extends StatefulWidget {
  const worldnewsScreen({super.key});

  @override
  State<worldnewsScreen> createState() => _worldnewsScreenState();
}

class _worldnewsScreenState extends State<worldnewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "World News Screen",
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
      ),    );
  }
}
