import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/core/utils/dependency_injection.dart';
import 'package:posts_app/features/posts/domain/entities/post_entity.dart';
import 'package:posts_app/features/posts/domain/use_cases/update_posts_use_case.dart';
import 'package:posts_app/features/posts/presentation/bloc/update_posts_bloc/update_posts_bloc.dart';
import 'package:posts_app/features/posts/presentation/views/update_posts_view.dart';

class UpdatePostsViewProvider extends StatelessWidget {
  final PostEntity postEntity;

  const UpdatePostsViewProvider({super.key, required this.postEntity});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdatePostsBloc(getIt.get<UpdatePostsUseCase>()),
      child: UpdatePostsView(
        postEntity: postEntity,
      ),
    );
  }
}
