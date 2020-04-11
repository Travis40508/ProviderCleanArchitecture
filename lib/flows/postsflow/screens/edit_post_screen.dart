import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_advanced/flows/postsflow/models/viewmodels/posts_view_model.dart';
import 'package:provider_advanced/flows/postsflow/routes/edit_post_route.dart';

class EditPostScreen extends StatelessWidget {

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final EditPostRoute _route = ModalRoute.of(context).settings.arguments;
    final PostsViewModel _postsViewModel = Provider.of<PostsViewModel>(context, listen: false);
    _titleController.text = _route.post.title;
    _bodyController.text = _route.post.body;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        centerTitle: true,
        title: Text('Edit Post'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 24.0, 8.0, 0.0),
            child: TextField(
              controller: _titleController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              maxLines: 8,
              controller: _bodyController,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () {
          _postsViewModel.updatePost(post: _route.post, newTitle: _titleController.text, newBody: _bodyController.text);
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
