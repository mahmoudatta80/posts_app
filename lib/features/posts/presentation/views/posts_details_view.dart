import 'package:flutter/material.dart';
import 'package:posts_app/features/posts/domain/entities/post_entity.dart';
import 'package:posts_app/features/posts/presentation/widgets/posts_details_view_body.dart';

class PostsDetailsView extends StatelessWidget {
  final PostEntity postEntity;
  const PostsDetailsView({super.key, required this.postEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Details',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xff082659),
        centerTitle: true,
      ),
      body: PostsDetailsViewBody(
        postEntity: postEntity,
      ),
    );
  }
}
