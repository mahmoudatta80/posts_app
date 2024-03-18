import 'package:dartz/dartz.dart';
import 'package:posts_app/core/error/failure.dart';
import 'package:posts_app/features/posts/domain/entities/post_entity.dart';
import 'package:posts_app/features/posts/domain/repo/posts_repo.dart';

class GetAllPostsUseCase {
  final PostsRepo postsRepo;

  GetAllPostsUseCase(this.postsRepo);

  Future<Either<Failure, List<PostEntity>>> call() async {
    return await postsRepo.getAllPosts();
  }
}
