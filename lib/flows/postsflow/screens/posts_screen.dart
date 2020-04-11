import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_advanced/repositories/postsrepository/models/viewmodels/posts_view_model.dart';

class PostsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PostsViewModel>(
      builder: (context, viewModel, child) {

        return ListView.builder(
          itemCount: viewModel.posts.length,
          itemBuilder: (_, index) {
            final post = viewModel.posts[index];

            return Card(
              elevation: 8.0,
              child: ListTile(
                title: Text(
                  post.title
                ),
              ),
            );
          },
        );
      },
    );
  }
}
