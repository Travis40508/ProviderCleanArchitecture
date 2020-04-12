import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_advanced/models/post.dart';
import 'package:provider_advanced/models/viewmodels/posts_view_model.dart';
import 'package:provider_advanced/screens/editpostsscreen/edit_post_route.dart';

class EditPostScreen extends StatelessWidget {

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //here we can always get the arguments that are provided
    final Map args = ModalRoute.of(context).settings.arguments;
    final Post post = args[EditPostRoute.argsKey];

    _titleController.text = post.title;
    _bodyController.text = post.body;

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
          //we can be sure that the viewmodel will always be provided
          Provider.of<PostsViewModel>(context, listen: false).updatePost(post: post, newTitle: _titleController.text, newBody: _bodyController.text);
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
