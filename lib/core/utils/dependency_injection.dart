import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:posts_app/core/utils/api_service.dart';
import 'package:posts_app/core/utils/network_info.dart';
import 'package:posts_app/features/posts/data/data_sources/local/local_data_source_impl.dart';
import 'package:posts_app/features/posts/data/data_sources/remote/remote_data_source_impl.dart';
import 'package:posts_app/features/posts/data/repo_impl/posts_repo_impl.dart';
import 'package:posts_app/features/posts/domain/use_cases/add_posts_use_case.dart';
import 'package:posts_app/features/posts/domain/use_cases/delete_posts_use_case.dart';
import 'package:posts_app/features/posts/domain/use_cases/get_all_posts_use_case.dart';
import 'package:posts_app/features/posts/domain/use_cases/update_posts_use_case.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  getIt.registerLazySingleton<Dio>(() => Dio());

  getIt.registerLazySingleton<ApiService>(
    () => ApiService(
      getIt<Dio>(),
    ),
  );

  getIt.registerLazySingleton<InternetConnectionChecker>(
    () => InternetConnectionChecker(),
  );

  getIt.registerLazySingleton<RemoteDataSourceImpl>(
    () => RemoteDataSourceImpl(
      getIt<ApiService>(),
    ),
  );

  getIt.registerLazySingleton<LocalDataSourceImpl>(
    () => LocalDataSourceImpl(),
  );

  getIt.registerLazySingleton<NetworkInfoImpl>(
    () => NetworkInfoImpl(
      getIt<InternetConnectionChecker>(),
    ),
  );

  getIt.registerLazySingleton<PostsRepoImpl>(
    () => PostsRepoImpl(
      getIt<RemoteDataSourceImpl>(),
      getIt<LocalDataSourceImpl>(),
      getIt<NetworkInfoImpl>(),
    ),
  );

  getIt.registerLazySingleton<GetAllPostsUseCase>(
        () => GetAllPostsUseCase(
      getIt<PostsRepoImpl>(),
    ),
  );

  getIt.registerLazySingleton<AddPostsUseCase>(
        () => AddPostsUseCase(
      getIt<PostsRepoImpl>(),
    ),
  );

  getIt.registerLazySingleton<DeletePostsUseCase>(
        () => DeletePostsUseCase(
      getIt<PostsRepoImpl>(),
    ),
  );

  getIt.registerLazySingleton<UpdatePostsUseCase>(
        () => UpdatePostsUseCase(
      getIt<PostsRepoImpl>(),
    ),
  );
}
