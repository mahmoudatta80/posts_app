import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/core/utils/my_snack_bar.dart';
import 'package:posts_app/core/widgets/custom_button.dart';
import 'package:posts_app/core/widgets/custom_loading.dart';
import 'package:posts_app/core/widgets/custom_text_form_field.dart';
import 'package:posts_app/features/posts/domain/entities/post_entity.dart';
import 'package:posts_app/features/posts/presentation/bloc/update_posts_bloc/update_posts_bloc.dart';
import 'package:posts_app/features/posts/presentation/widgets/posts_view_provider.dart';

class UpdatePostsViewBody extends StatefulWidget {
  final PostEntity postEntity;

  const UpdatePostsViewBody({super.key, required this.postEntity});

  @override
  State<UpdatePostsViewBody> createState() => _UpdatePostsViewBodyState();
}

class _UpdatePostsViewBodyState extends State<UpdatePostsViewBody> {
  @override
  void initState() {
    context.read<UpdatePostsBloc>().titleController.text =
        widget.postEntity.title;
    context.read<UpdatePostsBloc>().bodyController.text =
        widget.postEntity.body;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: GlobalKey(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomTextFormField(
            controller: context.read<UpdatePostsBloc>().titleController,
            maxLines: 1,
            name: 'Title',
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            controller: context.read<UpdatePostsBloc>().bodyController,
            maxLines: 6,
            name: 'Body',
          ),
          const SizedBox(height: 40),
          BlocConsumer<UpdatePostsBloc, UpdatePostsState>(
            listener: (context, state) {
              state.whenOrNull(
                success: () {
                  MySnackBar.showSuccessSnackBar(
                    message: 'Post was updated',
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
            builder: (context, state) =>
                context.read<UpdatePostsBloc>().updatePostIsLoading
                    ? const CustomLoading()
                    : CustomButton(
                        icon: Icons.add,
                        text: 'Update',
                        color: const Color(0xff082659),
                        onPressed: () {
                          PostEntity postEntity = PostEntity(
                            id: widget.postEntity.id,
                            title: context
                                .read<UpdatePostsBloc>()
                                .titleController
                                .text,
                            body: context
                                .read<UpdatePostsBloc>()
                                .bodyController
                                .text,
                          );
                          context
                              .read<UpdatePostsBloc>()
                              .add(UpdatePostsEvent.started(postEntity));
                        },
                      ),
          ),
        ],
      ),
    );
  }
}
