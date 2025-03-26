import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

// String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  final String? name;
  final String? email;
  final int? createdAt;
  final String? phoneNumber;
  final String? address;
  final String? image;
  final String? docId;

  UserModel({
    this.name,
    this.email,
    this.createdAt,
    this.phoneNumber,
    this.address,
    this.image,
    this.docId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    name: json["name"],
    email: json["email"],
    createdAt: json["createdAt"],
    phoneNumber: json["phoneNumber"],
    address: json["address"],
    image: json["image"],
    docId: json["docID"],
  );

  Map<String, dynamic> toJson(String docID) => {
    "name": name,
    "email": email,
    "createdAt": createdAt,
    "phoneNumber": phoneNumber,
    "address": address,
    "image": image,
    "docID": docId,
  };
}
