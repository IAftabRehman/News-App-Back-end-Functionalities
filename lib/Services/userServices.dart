import 'package:cloud_firestore/cloud_firestore.dart';
import '../Models/userModel.dart';


class UserServices {
  ///Create User
  Future createUser(UserModel model) async {
    DocumentReference documentReference =
    FirebaseFirestore.instance.collection('userCollection').doc();
    return await FirebaseFirestore.instance
        .collection('userCollection')
        .doc(documentReference.id)
        .set(model.toJson(documentReference.id));
  }

  ///Get User by ID
  Future<UserModel> getUserByID(String userID) async {
    return await FirebaseFirestore.instance
        .collection('userCollection')
        .doc(userID)
        .get()
        .then((val) {
      return UserModel.fromJson(val.data()!);
    });
  }


  Future updateTask(UserModel model) async {
    return await FirebaseFirestore.instance
        .collection('userCollection')
        .doc(model.docId)
        .update({
      "name": model.name,
      "email": model.email,
      "phone": model.phoneNumber,
      "password": model.password,
      "address": model.address,
    });
  }
}