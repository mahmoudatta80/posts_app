import 'package:posts_app/features/posts/domain/entities/post_entity.dart';

abstract class LocalDataSource {
  Future<List<PostEntity>> getCachedPosts();
}
