import 'package:posts_app/core/functions/get_cached_data.dart';
import 'package:posts_app/features/posts/data/data_sources/local/local_data_source.dart';
import 'package:posts_app/features/posts/data/models/post_model.dart';
import 'package:posts_app/features/posts/domain/entities/post_entity.dart';

class LocalDataSourceImpl extends LocalDataSource {
  @override
  Future<List<PostEntity>> getCachedPosts() async {
    List<PostModel> posts = await getCachedData();
    return posts;
  }
}
