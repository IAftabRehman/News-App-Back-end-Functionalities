import 'dart:convert';

CityModel cityModelFromJson(String str) => CityModel.fromJson(json.decode(str));

String cityModelToJson(CityModel data) => json.encode(data.toJson());

class CityModel {
  final String? docId;
  final int? createdAt;
  final String? cityName;

  CityModel({
    this.docId,
    this.createdAt,
    this.cityName,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
    docId: json["DocId"],
    createdAt: json["createdAt"],
    cityName: json["CityName"],
  );

  Map<String, dynamic> toJson() => {
    "DocId": docId,
    "createdAt": createdAt,
    "CityName": cityName,
  };
}
