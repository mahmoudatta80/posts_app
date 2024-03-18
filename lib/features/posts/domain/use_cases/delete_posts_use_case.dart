import 'package:dartz/dartz.dart';
import 'package:posts_app/core/error/failure.dart';
import 'package:posts_app/features/posts/domain/repo/posts_repo.dart';

class DeletePostsUseCase {
  final PostsRepo postsRepo;

  DeletePostsUseCase(this.postsRepo);

  Future<Either<Failure, Unit>> call(int id) async {
    return await postsRepo.deletePost(id);
  }
}
