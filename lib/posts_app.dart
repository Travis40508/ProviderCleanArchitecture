import 'package:flutter/material.dart';

import 'flows/postsflow/posts_flow.dart';


class PostsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Posts Application',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => PostsFlow(),
      },
    );
  }
}
