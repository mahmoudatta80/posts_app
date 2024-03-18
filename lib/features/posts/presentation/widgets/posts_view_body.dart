import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/core/widgets/custom_error.dart';
import 'package:posts_app/core/widgets/custom_loading.dart';
import 'package:posts_app/features/posts/presentation/bloc/get_all_posts_bloc/get_all_posts_bloc.dart';
import 'package:posts_app/features/posts/presentation/widgets/posts_details_view_provider.dart';

class PostsViewBody extends StatelessWidget {
  const PostsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        return BlocProvider.of<GetAllPostsBloc>(context).add(
          const GetAllPostsEvent.refresh(),
        );
      },
      child: BlocBuilder<GetAllPostsBloc, GetAllPostsState>(
        builder: (context, state) {
          return state.maybeWhen(
            success: (posts) => ListView.separated(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text(
                    posts[index].id.toString(),
                  ),
                  title: Text(
                    posts[index].title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    posts[index].body,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => PostsDetailsViewProvider(
                          postEntity: posts[index],
                        ),
                      ),
                    );
                  },
                );
              },
              separatorBuilder: (context, index) => const Divider(
                thickness: 1,
              ),
            ),
            failure: (errorMessage) => CustomError(errorMessage: errorMessage),
            orElse: () => const CustomLoading(),
          );
        },
      ),
    );
  }
}
