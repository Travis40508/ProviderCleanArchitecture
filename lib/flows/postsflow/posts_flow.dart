import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_advanced/flows/postsflow/screens/new_post_screen.dart';
import 'package:provider_advanced/flows/postsflow/screens/posts_screen.dart';
import 'package:provider_advanced/repositories/postsrepository/models/viewmodels/posts_view_model.dart';
import 'package:provider_advanced/repositories/postsrepository/posts_repository.dart';
import 'package:provider_advanced/repositories/postsrepository/posts_repository_impl.dart';
import 'package:provider_advanced/repositories/postsrepository/posts_service_impl.dart';


class PostsFlow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => PostsServiceImpl(),
        ),
        ProxyProvider<PostsServiceImpl, PostsRepository>(
          update: (context, service, __) => PostsRepositoryImpl(service),
        ),
        ChangeNotifierProvider<PostsViewModel>(
          create: (context) => PostsViewModel(Provider.of<PostsRepository>(context, listen: false)),
        )
      ],
      child: Navigator(
        initialRoute: 'posts/posts_list',
        onGenerateRoute: (RouteSettings settings) {
          WidgetBuilder builder;

          switch(settings.name) {
            case 'posts/posts_list':
              builder = (context) => PostsScreen();
              break;
            case 'posts/new_post':
              builder= (context) => NewPostScreen();
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
