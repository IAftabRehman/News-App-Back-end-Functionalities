// To parse this JSON data, do
//
//     final countryModel = countryModelFromJson(jsonString);

import 'dart:convert';

CountryModel countryModelFromJson(String str) => CountryModel.fromJson(json.decode(str));

String countryModelToJson(CountryModel data) => json.encode(data.toJson());

class CountryModel {
  final String? docId;
  final int? createdAt;
  final String? countryName;
  final String? countryCode;

  CountryModel({
    this.docId,
    this.createdAt,
    this.countryName,
    this.countryCode,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
    docId: json["DocId"],
    createdAt: json["createdAt"],
    countryName: json["countryName"],
    countryCode: json["countryCode"],
  );

  Map<String, dynamic> toJson() => {
    "DocId": docId,
    "createdAt": createdAt,
    "countryName": countryName,
    "countryCode": countryCode,
  };
}
