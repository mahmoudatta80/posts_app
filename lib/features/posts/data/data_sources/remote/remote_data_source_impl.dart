import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:posts_app/core/functions/save_cached_data.dart';
import 'package:posts_app/core/utils/api_service.dart';
import 'package:posts_app/features/posts/data/data_sources/remote/remote_data_source.dart';
import 'package:posts_app/features/posts/data/models/post_model.dart';
import 'package:posts_app/features/posts/domain/entities/post_entity.dart';

class RemoteDataSourceImpl extends RemoteDataSource {
  final ApiService apiService;

  RemoteDataSourceImpl(this.apiService);

  @override
  Future<Unit> addPost(PostEntity postEntity) async {
    await apiService.post(
      data: {
        "title": postEntity.title,
        "body": postEntity.body,
      },
    );

    return Future.value(unit);
  }

  @override
  Future<Unit> deletePost(int id) async {
    await apiService.delete(id: id);

    return Future.value(unit);
  }

  @override
  Future<List<PostEntity>> getAllPosts() async {
    Response response = await apiService.get();
    List<PostModel> posts = [];
    for (var post in response.data) {
      posts.add(PostModel.fromJson(post));
    }
    saveCachedData(posts);
    return posts;
  }

  @override
  Future<Unit> updatePost(PostEntity postEntity) async {
    await apiService.update(
      id: postEntity.id!,
      data: {
        "title": postEntity.title,
        "body": postEntity.body,
      },
    );

    return Future.value(unit);
  }
}
