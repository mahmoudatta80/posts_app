import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/core/utils/my_snack_bar.dart';
import 'package:posts_app/core/widgets/custom_button.dart';
import 'package:posts_app/core/widgets/custom_loading.dart';
import 'package:posts_app/core/widgets/custom_text_form_field.dart';
import 'package:posts_app/features/posts/domain/entities/post_entity.dart';
import 'package:posts_app/features/posts/presentation/bloc/add_posts_bloc/add_posts_bloc.dart';
import 'package:posts_app/features/posts/presentation/widgets/posts_view_provider.dart';

class AddPostsViewBody extends StatelessWidget {
  const AddPostsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: GlobalKey(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomTextFormField(
            controller: context.read<AddPostsBloc>().titleController,
            maxLines: 1,
            name: 'Title',
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            controller: context.read<AddPostsBloc>().bodyController,
            maxLines: 6,
            name: 'Body',
          ),
          const SizedBox(height: 40),
          BlocConsumer<AddPostsBloc, AddPostsState>(
            listener: (context, state) {
              state.whenOrNull(
                success: () {
                  MySnackBar.showSuccessSnackBar(
                    message: 'Post was added',
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
                    .read<AddPostsBloc>()
                    .addPostIsLoading
                ? const CustomLoading()
                : CustomButton(
                    icon: Icons.add,
                    text: 'Add',
                    color: const Color(0xff082659),
                    onPressed: () {
                      PostEntity postEntity = PostEntity(
                        title:
                            context.read<AddPostsBloc>().titleController.text,
                        body: context.read<AddPostsBloc>().bodyController.text,
                      );
                      context
                          .read<AddPostsBloc>()
                          .add(AddPostsEvent.started(postEntity));
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
