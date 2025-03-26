import 'dart:convert';

AreaModel areaModelFromJson(String str) => AreaModel.fromJson(json.decode(str));

String areaModelToJson(AreaModel data) => json.encode(data.toJson());

class AreaModel {
  final String? docId;
  final int? createdAt;
  final String? areaName;

  AreaModel({
    this.docId,
    this.createdAt,
    this.areaName,
  });

  factory AreaModel.fromJson(Map<String, dynamic> json) => AreaModel(
    docId: json["DocId"],
    createdAt: json["createdAt"],
    areaName: json["AreaName"],
  );

  Map<String, dynamic> toJson() => {
    "DocId": docId,
    "createdAt": createdAt,
    "AreaName": areaName,
  };
}
