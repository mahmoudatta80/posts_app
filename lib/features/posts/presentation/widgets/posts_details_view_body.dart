import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/core/utils/my_snack_bar.dart';
import 'package:posts_app/core/widgets/custom_button.dart';
import 'package:posts_app/core/widgets/custom_loading.dart';
import 'package:posts_app/features/posts/domain/entities/post_entity.dart';
import 'package:posts_app/features/posts/presentation/bloc/delete_posts_bloc/delete_posts_bloc.dart';
import 'package:posts_app/features/posts/presentation/widgets/posts_view_provider.dart';
import 'package:posts_app/features/posts/presentation/widgets/update_posts_view_provider.dart';

class PostsDetailsViewBody extends StatelessWidget {
  final PostEntity postEntity;

  const PostsDetailsViewBody({super.key, required this.postEntity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Text(
            postEntity.title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            postEntity.body,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const Divider(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButton(
                icon: Icons.edit,
                text: 'Edit',
                color: const Color(0xff082659),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => UpdatePostsViewProvider(
                        postEntity: postEntity,
                      ),
                    ),
                  );
                },
              ),
              BlocConsumer<DeletePostsBloc, DeletePostsState>(
                listener: (context, state) {
                  state.whenOrNull(
                    success: () {
                      MySnackBar.showSuccessSnackBar(
                        message: 'Post was deleted',
                        context: context,
                      );
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => const PostsViewProvider(),
                        ),
                        (route) => false,
                      );
                    },
                    failure: (errorMessage) => MySnackBar.showErrorSnackBar(
                      message: errorMessage,
                      context: context,
                    ),
                  );
                },
                builder: (context, state) => context
                        .read<DeletePostsBloc>()
                        .deletePostIsLoading
                    ? const CustomLoading()
                    : CustomButton(
                        icon: Icons.delete_outline,
                        text: 'Delete',
                        color: Colors.red,
                        onPressed: () {
                          context
                              .read<DeletePostsBloc>()
                              .add(DeletePostsEvent.started(postEntity.id!));
                        },
                      ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
