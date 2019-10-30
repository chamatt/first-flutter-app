// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

List<Post> allPostsFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String allPostsToJson(List<Post> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

String url = 'https://jsonplaceholder.typicode.com/posts';

class Post {
  int userId;
  int id;
  String title;
  String body;

  Post({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };

  static Future<List<Post>> getPosts() async {
    http.Response response = await http.get(url);
    return allPostsFromJson(response.body);
  }

  static Future<Post> getPost({int id = 1}) async {
    http.Response response = await http.get('$url/$id');
    return postFromJson(response.body);
  }
}
