// To parse this JSON data, do
//
//     final categoriesModel = categoriesModelFromJson(jsonString);

import 'dart:convert';

CategoriesModel categoriesModelFromJson(String str) => CategoriesModel.fromJson(json.decode(str));

String categoriesModelToJson(CategoriesModel data) => json.encode(data.toJson());

class CategoriesModel {
  final String? docId;
  final int? createdAt;
  final String? categoriesName;

  CategoriesModel({
    this.docId,
    this.createdAt,
    this.categoriesName,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) => CategoriesModel(
    docId: json["DocId"],
    createdAt: json["createdAt"],
    categoriesName: json["categoriesName"],
  );

  Map<String, dynamic> toJson() => {
    "DocId": docId,
    "createdAt": createdAt,
    "categoriesName": categoriesName,
  };
}
