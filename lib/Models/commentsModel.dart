import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
CommentsModel commentsModelFromJson(String str) => CommentsModel.fromJson(json.decode(str));

String commentsModelToJson(CommentsModel data) => json.encode(data.toJson());

class CommentsModel {
  final String? comment;
  final String? docId;
  final Timestamp? timestamp;

  CommentsModel({
    required this.comment,
    required this.docId,
    required this.timestamp,
  });

  factory CommentsModel.fromJson(Map<String, dynamic> json) => CommentsModel(
    comment: json["comment"],
    docId: json["id"],
    timestamp: json["timestamp"] ?? Timestamp.now(),
  );

  Map<String, dynamic> toJson() => {
    "comment": comment,
    "id": docId,
    "timestamp": timestamp,
  };
}
