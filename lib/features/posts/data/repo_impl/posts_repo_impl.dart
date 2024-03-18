import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:posts_app/core/error/failure.dart';
import 'package:posts_app/core/error/offline_failure.dart';
import 'package:posts_app/core/error/server_failure.dart';
import 'package:posts_app/core/utils/network_info.dart';
import 'package:posts_app/features/posts/data/data_sources/local/local_data_source.dart';
import 'package:posts_app/features/posts/data/data_sources/remote/remote_data_source.dart';
import 'package:posts_app/features/posts/domain/entities/post_entity.dart';
import 'package:posts_app/features/posts/domain/repo/posts_repo.dart';

class PostsRepoImpl extends PostsRepo {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  PostsRepoImpl(
    this.remoteDataSource,
    this.localDataSource,
    this.networkInfo,
  );

  @override
  Future<Either<Failure, Unit>> addPost(PostEntity postEntity) async {
    if(await networkInfo.isConnected) {
      try {
        await remoteDataSource.getAllPosts();
        return const Right(unit);
      } catch (error) {
        if (error is DioException) {
          return Left(
            ServerFailure.fromDioException(error),
          );
        } else {
          return Left(ServerFailure(error.toString()));
        }
      }
    } else {
      return Left(OfflineFailure('Check your connection'));
    }
  }

  @override
  Future<Either<Failure, Unit>> deletePost(int id) async{
    if(await networkInfo.isConnected) {
      try {
        await remoteDataSource.deletePost(id);
        return const Right(unit);
      } catch (error) {
        if (error is DioException) {
          return Left(
            ServerFailure.fromDioException(error),
          );
        } else {
          return Left(ServerFailure(error.toString()));
        }
      }
    } else {
      return Left(OfflineFailure('Check your connection'));
    }
  }

  @override
  Future<Either<Failure, List<PostEntity>>> getAllPosts() async {
    try {
      List<PostEntity> posts;
      posts = await localDataSource.getCachedPosts();
      if (posts.isNotEmpty) {
        return Right(posts);
      }
      posts = await remoteDataSource.getAllPosts();
      return Right(posts);
    } catch (error) {
      if (error is DioException) {
        return Left(
          ServerFailure.fromDioException(error),
        );
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> updatePost(PostEntity postEntity) async{
    if(await networkInfo.isConnected) {
      try {
        await remoteDataSource.updatePost(postEntity);
        return const Right(unit);
      } catch (error) {
        if (error is DioException) {
          return Left(
            ServerFailure.fromDioException(error),
          );
        } else {
          return Left(ServerFailure(error.toString()));
        }
      }
    } else {
      return Left(OfflineFailure('Check your connection'));
    }
  }
}
