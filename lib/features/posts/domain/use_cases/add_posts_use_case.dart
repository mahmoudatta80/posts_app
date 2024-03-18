import 'package:dartz/dartz.dart';
import 'package:posts_app/core/error/failure.dart';
import 'package:posts_app/features/posts/domain/entities/post_entity.dart';
import 'package:posts_app/features/posts/domain/repo/posts_repo.dart';

class AddPostsUseCase {
  final PostsRepo postsRepo;

  AddPostsUseCase(this.postsRepo);

  Future<Either<Failure, Unit>> call(PostEntity postEntity) async {
    return await postsRepo.addPost(postEntity);
  }
}
