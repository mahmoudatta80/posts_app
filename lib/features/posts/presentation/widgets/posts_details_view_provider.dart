import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/core/utils/dependency_injection.dart';
import 'package:posts_app/features/posts/domain/entities/post_entity.dart';
import 'package:posts_app/features/posts/domain/use_cases/delete_posts_use_case.dart';
import 'package:posts_app/features/posts/presentation/bloc/delete_posts_bloc/delete_posts_bloc.dart';
import 'package:posts_app/features/posts/presentation/views/posts_details_view.dart';

class PostsDetailsViewProvider extends StatelessWidget {
  final PostEntity postEntity;

  const PostsDetailsViewProvider({super.key, required this.postEntity});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeletePostsBloc(getIt.get<DeletePostsUseCase>()),
      child: PostsDetailsView(
        postEntity: postEntity,
      ),
    );
  }
}
