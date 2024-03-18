import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/core/utils/dependency_injection.dart';
import 'package:posts_app/features/posts/domain/use_cases/get_all_posts_use_case.dart';
import 'package:posts_app/features/posts/presentation/bloc/get_all_posts_bloc/get_all_posts_bloc.dart';
import 'package:posts_app/features/posts/presentation/views/posts_view.dart';

class PostsViewProvider extends StatelessWidget {
  const PostsViewProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetAllPostsBloc(getIt.get<GetAllPostsUseCase>())
        ..add(
          const GetAllPostsEvent.started(),
        ),
      child: const PostsView(),
    );
  }
}
