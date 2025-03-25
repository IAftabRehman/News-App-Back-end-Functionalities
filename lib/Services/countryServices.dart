import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:news_app_backend_functionalities/Models/countryModel.dart';

class CountryServices {
  ///Create User
  Future<void> createCountry(CountryModel model) async {
    return await FirebaseFirestore.instance
        .collection('countryCollection')
        .doc(model.docId)
        .set(model.toJson());
  }


  ///Get User by ID
  Future<CountryModel> getUserByID(String userID) async {
    return await FirebaseFirestore.instance
        .collection('countryCollection')
        .doc(userID)
        .get()
        .then((val) {
      return CountryModel.fromJson(val.data()!);
    });
  }

  ///Update User Profile
  Future updateTask(CountryModel model) async {
    return await FirebaseFirestore.instance
        .collection('countryCollection')
        .doc(model.docId)
        .update({
      "countryName": model.countryName,
      "countryCode": model.countryCode,
    });
  }
}