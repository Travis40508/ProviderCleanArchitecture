import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_advanced/flows/postsflow/routes/edit_post_route.dart';
import 'package:provider_advanced/repositories/postsrepository/models/viewmodels/posts_view_model.dart';

class EditPostScreen extends StatelessWidget {

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final EditPostRoute _route = ModalRoute.of(context).settings.arguments;
    final PostsViewModel _postsViewModel = Provider.of<PostsViewModel>(context, listen: false);
    _controller.text = _route.post.title;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        centerTitle: true,
        title: Text('Edit Post'),
      ),
      body: Center(
        child: TextField(
          controller: _controller,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () {
          _postsViewModel.updatePost(post: _route.post, newTitle: _controller.text);
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
