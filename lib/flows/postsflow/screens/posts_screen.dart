import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_advanced/flows/postsflow/models/viewmodels/posts_view_model.dart';
import 'package:provider_advanced/flows/postsflow/routes/edit_post_route.dart';

import '../posts_flow.dart';

class PostsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        centerTitle: true,
        title: Text('Posts'),
      ),

      body: Consumer<PostsViewModel>(
        builder: (context, viewModel, child) {

          return ListView.builder(
            itemCount: viewModel.posts.length,
            itemBuilder: (_, index) {
              final post = viewModel.posts[index];

              return viewModel.posts.isNotEmpty ? Card(
                elevation: 8.0,
                child: ListTile(
                  onTap: () => Navigator.of(context).pushNamed(editPostRouteName, arguments: EditPostRoute(post: post)),
                  title: Text(
                      post.title
                  ),
                ),
              ) : Center(child: CircularProgressIndicator(),);
            },
          );
        },
      ),
    );
  }
}
