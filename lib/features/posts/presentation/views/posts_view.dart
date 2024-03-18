import 'package:flutter/material.dart';
import 'package:posts_app/features/posts/presentation/widgets/add_posts_view_provider.dart';
import 'package:posts_app/features/posts/presentation/widgets/posts_view_body.dart';

class PostsView extends StatelessWidget {
  const PostsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Posts',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xff082659),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 5,
        ),
        child: PostsViewBody(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const AddPostsViewProvider(),
          ));
        },
        backgroundColor: const Color(0xff082659),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
