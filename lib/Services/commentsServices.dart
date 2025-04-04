import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Models/commentsModel.dart';

// String currentUser = FirebaseAuth.instance.currentUser!.uid.toString();
// String extraId = CategoriesServices().extraId(currentUser) as String;

class CommentsServices {
  Stream<QuerySnapshot> getComments(String extraId) {
    return FirebaseFirestore.instance
        .collection('commentsCollection')
        .where("extraId", isEqualTo: extraId)
        .orderBy('createdAt', descending: true)
        .snapshots();
  }

  Future<DocumentReference<Map<String, dynamic>>> addComment(
    CommentsModel model,
  ) async {
    return await FirebaseFirestore.instance
        .collection('commentsCollection')
        .add(model.toJson());
  }


}



