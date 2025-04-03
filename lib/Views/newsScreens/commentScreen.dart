import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app_backend_functionalities/Models/categoriesModel.dart';
import 'package:news_app_backend_functionalities/Models/commentsModel.dart';
import 'package:news_app_backend_functionalities/Models/userModel.dart';
import 'package:news_app_backend_functionalities/Services/categoriesServices.dart';
import 'package:news_app_backend_functionalities/Services/commentsServices.dart';

class comments_screen extends StatefulWidget {
  const comments_screen({super.key});

  @override
  State<comments_screen> createState() => _comments_screenState();
}

class _comments_screenState extends State<comments_screen> {

  bool isLoading = false;
  bool like = false;
  bool comment = false;
  final TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity, // ✅ Make sure it has a defined width
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.6),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // ✅ Prevent taking infinite height
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(onPressed: (){
                setState(() {
                  like = !like;
                });
              }, icon: Icon(Icons.thumb_up, size: 30, color: like ? Colors.blue : Colors.white)),
              SizedBox(width: 10),
              IconButton(onPressed: (){
                setState(() {
                  comment = !comment;
                });
              }, icon: Icon(Icons.message, size: 30, color: comment ? Colors.blue : Colors.white)),
              SizedBox(width: 10),
              Icon(Icons.share_sharp, size: 30, color: Colors.white),
            ],
          ),
          SizedBox(height: 10),
          comment ? CommentsWidget() : SizedBox(),
          SizedBox(height: 10),
          comment ? Row(
            children: [
              Expanded(
                child: TextField(
                  controller: commentController,
                  keyboardType: TextInputType.text,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Write a comment...",
                    hintStyle: TextStyle(color: Colors.white54),
                    border: InputBorder.none, // Removes default underline
                  ),
                ),
              ),
              isLoading ? Center(child: CircularProgressIndicator()):
              IconButton(
                icon: Icon(Icons.send, color: Colors.white),
                onPressed: () async {
                  if (commentController.text.isNotEmpty) {
                    String commentText = commentController.text; // ✅ Store the text first
                    print("Comment: $commentText");

                    String currentUser = FirebaseAuth.instance.currentUser!.uid.toString();
                    try {
                      isLoading = true;
                      setState(() {});
                      await CommentsServices().addComment(CommentsModel(
                        comment: commentText,
                        timestamp: Timestamp.now(),
                        docId: currentUser.toString(),
                      )).then((val) {
                        isLoading = false;
                        setState(() {});
                        commentController.clear();
                      });

                    } catch (e) {
                      isLoading = false;
                      setState(() {});
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
                    }
                  }
                },
              ),
            ],
          ) : SizedBox(),
        ],
      ),
    );
  }
}



class CommentsWidget extends StatelessWidget {
  const CommentsWidget({super.key});

  Stream<QuerySnapshot> getComments() =>
      FirebaseFirestore.instance.collection('commentsCollection')
          .orderBy('timestamp', descending: true)
          .snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: getComments(),
      builder: (context, snapshot) {
        if (snapshot.hasError) return Center(child: Text("Error loading comments"));
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(child: Text("No comments yet"));
        }

        return ListView(
          shrinkWrap: true, // ✅ Fix infinite size error
          physics: NeverScrollableScrollPhysics(), // ✅ Prevent nested scroll issue
          children: snapshot.data!.docs.map((doc) {
            final comment = (doc.data() as Map<String, dynamic>)['comment'] ?? 'No comment';
            return Row(
              children: [
                Text(": ", style: TextStyle(fontSize: 16, color: Colors.white)),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text("$comment", style: TextStyle(fontSize: 16, color: Colors.white)),
                ),
              ],
            );
          }).toList(),
        );
      },
    );
  }
}