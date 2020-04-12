import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_advanced/screens/chucknorrisfactsscreen/chuck_norris_facts_route.dart';
import 'package:provider_advanced/screens/editpostsscreen/edit_post_route.dart';
import 'package:provider_advanced/screens/postsscreen/posts_route.dart';
import 'package:provider_advanced/models/global_view_model.dart';
import 'screens/postsscreen/posts_route.dart';



class PostsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      //no impl for GlobalViewModel, but this is how you could provide global dependencies
      create: (context) => GlobalViewModel(),
      child: MaterialApp(
        title: 'Posts Application',
        debugShowCheckedModeBanner: false,
        initialRoute: PostsRoute.routeName,
        onGenerateRoute: (RouteSettings settings) {
          WidgetBuilder builder;

          switch(settings.name) {
            case PostsRoute.routeName:
              builder = (context) => PostsRoute();
              break;
            case EditPostRoute.routeName:
              builder = (context) => EditPostRoute();
              break;
            case ChuckNorrisFactsRoute.routeName:
              builder = (context) => ChuckNorrisFactsRoute();
              break;
            default:
              throw Exception('invalid route ${settings.name}');
          }

          return MaterialPageRoute(builder: builder, settings: settings);
        },
      ),
    );
  }
}
