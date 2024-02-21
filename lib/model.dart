// To parse this JSON data, do
//
//     final samplePost = samplePostFromJson(jsonString);

import 'dart:convert';

List<SamplePost> samplePostFromJson(String str) => List<SamplePost>.from(json.decode(str).map((x) => SamplePost.fromJson(x)));

String samplePostToJson(List<SamplePost> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SamplePost {
  int userId;
  int id;
  String title;
  bool completed;

  SamplePost({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });
  factory SamplePost.fromJson(Map<String, dynamic> json) => SamplePost(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    completed: json["completed"],
  );
  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "completed": completed,
  };
}
