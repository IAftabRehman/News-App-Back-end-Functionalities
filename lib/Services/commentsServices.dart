import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:news_app_backend_functionalities/Services/categoriesServices.dart';
import '../Models/commentsModel.dart';
String currentUser = FirebaseAuth.instance.currentUser!.uid;
String extraId = CategoriesServices().getExtraId(currentUser).toString();
class CommentsServices {
  Stream<QuerySnapshot> getComments() {
    return FirebaseFirestore.instance
        .collection('commentsCollection')
        .where('extraId', isEqualTo: extraId)
        .orderBy('timestamp', descending: true)
        .snapshots();
  }

  Future<void> addComment(CommentsModel model) async {
    return await FirebaseFirestore.instance
        .collection('commentsCollection')
        .doc(model.docId)
        .set(model.toJson());
  }
}
