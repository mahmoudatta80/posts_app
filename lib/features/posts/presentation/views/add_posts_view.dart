import 'package:flutter/material.dart';
import 'package:posts_app/features/posts/presentation/widgets/add_posts_view_body.dart';

class AddPostsView extends StatelessWidget {
  const AddPostsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Post',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xff082659),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: AddPostsViewBody(),
      ),
    );
  }
}
