import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_advanced/models/global_view_model.dart';
import 'flows/postsflow/posts_flow.dart';


const postsFlowRouteName = '/';

class PostsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      //no impl for GlobalViewModel, but this is how you could provide global dependencies
      create: (context) => GlobalViewModel(),
      child: MaterialApp(
        title: 'Posts Application',
        debugShowCheckedModeBanner: false,
        initialRoute: postsFlowRouteName,
        routes: {
          postsFlowRouteName: (context) => PostsFlow(),
        },
      ),
    );
  }
}
