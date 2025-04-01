import 'package:flutter/material.dart';

class comments_screen extends StatefulWidget {
  const comments_screen({super.key});

  @override
  State<comments_screen> createState() => _comments_screenState();
}

class _comments_screenState extends State<comments_screen> {
  bool like = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.6),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              like = !like;
              setState(() {
              });
            },
            child: Icon(Icons.thumb_up, size: 30, color:  like ? Colors.blue: Colors.white),
          ),
          Icon(Icons.comment, size: 30, color: Colors.white),
          Icon(Icons.share_sharp, size: 30, color: Colors.white),
        ],
      ),
    );
  }
}
