import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:news_app_backend_functionalities/Models/areaModel.dart';

class AreaServices{
  Future<void> creatArea(AreaModel model) async{
    return await FirebaseFirestore.instance
        .collection('areaCollection')
        .doc(model.docId)
        .set(model.toJson());
  }
}