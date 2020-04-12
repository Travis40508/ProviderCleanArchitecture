import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_advanced/models/viewmodels/posts_view_model.dart';
import 'package:provider_advanced/screens/editpostsscreen/edit_post_route.dart';


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
                elevation: 4.0,
                child: ListTile(
                  onTap: () => Navigator.pushNamed(context, EditPostRoute.routeName, arguments: post),
                  title: Text(
                      post.title
                  ),
                  subtitle: Text(
                    post.body
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
