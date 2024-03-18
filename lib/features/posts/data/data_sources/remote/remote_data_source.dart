import 'package:dartz/dartz.dart';
import 'package:posts_app/features/posts/domain/entities/post_entity.dart';

abstract class RemoteDataSource {
  Future<List<PostEntity>> getAllPosts();

  Future<Unit> deletePost(int id);

  Future<Unit> updatePost(PostEntity postEntity);

  Future<Unit> addPost(PostEntity postEntity);
}
