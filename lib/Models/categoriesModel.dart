import 'dart:convert';

CategoriesModel categoriesModelFromJson(String str) => CategoriesModel.fromJson(json.decode(str));

String categoriesModelToJson(CategoriesModel data) => json.encode(data.toJson());

class CategoriesModel {
  final String? docId;
  final String? extraId;
  final int? createdAt;
  final String? categoriesName;

  CategoriesModel({
    this.docId,
    this.extraId,
    this.createdAt,
    this.categoriesName,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) => CategoriesModel(
    docId: json["docId"],
    extraId: json["extraId"],
    createdAt: json["createdAt"],
    categoriesName: json["categoriesName"],
  );

  Map<String, dynamic> toJson() => {
    "docId": docId,
    "extraId": extraId,
    "createdAt": createdAt,
    "categoriesName": categoriesName,
  };
}
