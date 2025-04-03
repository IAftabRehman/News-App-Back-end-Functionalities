import 'package:cloud_firestore/cloud_firestore.dart';
import '../Models/categoriesModel.dart';

class CategoriesServices {
  Future<void> createCategories(CategoriesModel model) async {
    return await FirebaseFirestore.instance
        .collection('categoriesCollection')
        .doc(model.docId)
        .set(model.toJson());
  }
  Future<String?> getExtraId(String docId) async {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('categoriesCollection')
          .doc(docId)
          .get();
      doc["extraId"];
  }
}
