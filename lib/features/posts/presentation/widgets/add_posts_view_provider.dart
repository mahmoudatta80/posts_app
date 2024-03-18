import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/core/utils/dependency_injection.dart';
import 'package:posts_app/features/posts/domain/use_cases/add_posts_use_case.dart';
import 'package:posts_app/features/posts/presentation/bloc/add_posts_bloc/add_posts_bloc.dart';
import 'package:posts_app/features/posts/presentation/views/add_posts_view.dart';

class AddPostsViewProvider extends StatelessWidget {
  const AddPostsViewProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddPostsBloc(getIt.get<AddPostsUseCase>()),
      child: const AddPostsView(),
    );
  }
}
