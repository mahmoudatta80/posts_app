import 'dart:convert';

import 'package:posts_app/core/utils/my_shared_preferences.dart';
import 'package:posts_app/features/posts/data/models/post_model.dart';

Future<List<PostModel>> getCachedData() async {
  final cachedPosts = MySharedPreferences.getString('cachedPosts');
  List<PostModel> posts = [];
  if (cachedPosts.isNotEmpty) {
    List decodeJsonData = json.decode(cachedPosts);
    posts = decodeJsonData
        .map(
          (jsonPosts) => PostModel.fromJson(jsonPosts),
        )
        .toList();
  }
  return posts;
}
