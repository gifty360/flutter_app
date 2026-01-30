import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import '../models/post.dart';

class PostRepository {
  final String baseUrl = "https://jsonplaceholder.typicode.com";

  Future<Post?> fetchPost(int id) async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/posts/$id"));
      if (response.statusCode == 200) {
        return Post.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      print("Error fetching post: $e");
    }
    return null;
  }
  Future<Post?> createPost(Post post) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/posts"),
        body: post.toJson(),
      );
      if (response.statusCode == 201) {
        return Post.fromJson(jsonDecode(response.body));
      }
    }  catch (e) {
      print("Error creating post: $e");
    }
    return null;
  }
}
