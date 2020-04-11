import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_advanced/flows/postsflow/screens/edit_post_screen.dart';
import 'package:provider_advanced/flows/postsflow/screens/posts_screen.dart';
import 'package:provider_advanced/repositories/postsrepository/models/viewmodels/posts_view_model.dart';
import 'package:provider_advanced/repositories/postsrepository/posts_repository.dart';
import 'package:provider_advanced/repositories/postsrepository/posts_repository_impl.dart';
import 'package:provider_advanced/repositories/postsrepository/posts_service_impl.dart';


const String editPostRouteName = 'posts/edit_post';
const String postsRouteName = 'posts/posts_list';

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
        initialRoute: postsRouteName,
        onGenerateRoute: (RouteSettings settings) {
          WidgetBuilder builder;

          switch(settings.name) {
            case postsRouteName:
              builder = (context) => PostsScreen();
              break;
            case editPostRouteName:
              builder = (context) => EditPostScreen();
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
