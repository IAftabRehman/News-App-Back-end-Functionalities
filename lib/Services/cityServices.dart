import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:news_app_backend_functionalities/Models/cityModel.dart';

class CityServices{
  Future<void> createCity(CityModel model) async {
    return await FirebaseFirestore.instance
        .collection('cityCollection')
        .doc(model.docId)
        .set(model.toJson());
  }
}