import 'dart:convert';

import 'package:posts_app/core/utils/my_shared_preferences.dart';
import 'package:posts_app/features/posts/data/models/post_model.dart';

saveCachedData(List<PostModel> posts) async {
  String encodeJsonData = json.encode(
    posts
        .map(
          (posts) => posts.toJson(),
        )
        .toList(),
  );
  await MySharedPreferences.setString(
    'cachedPosts',
    encodeJsonData,
  );
}
