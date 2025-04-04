import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
CommentsModel commentsModelFromJson(String str) => CommentsModel.fromJson(json.decode(str));

String commentsModelToJson(CommentsModel data) => json.encode(data.toJson());

class CommentsModel {
  final String? comment;
  final String? docId;
  final String? extraId;
  final int? createdAt;

  CommentsModel({
    required this.comment,
    required this.docId,
    required this.extraId,
    required this.createdAt,
  });

  factory CommentsModel.fromJson(Map<String, dynamic> json) => CommentsModel(
    comment: json["comment"],
    docId: json["id"],
    extraId: json["extraId"],
    createdAt: json["createdAt"],
  );

  Map<String, dynamic> toJson() => {
    "comment": comment,
    "id": docId,
    "extraId": extraId,
    "createdAt": createdAt,
  };
}
