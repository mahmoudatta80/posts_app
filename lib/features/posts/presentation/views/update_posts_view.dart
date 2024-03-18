import 'package:flutter/material.dart';
import 'package:posts_app/features/posts/domain/entities/post_entity.dart';
import 'package:posts_app/features/posts/presentation/widgets/update_posts_view_body.dart';

class UpdatePostsView extends StatelessWidget {
  final PostEntity postEntity;
  const UpdatePostsView({super.key, required this.postEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Update Post',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xff082659),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: UpdatePostsViewBody(
          postEntity: postEntity,
        ),
      ),
    );
  }
}
