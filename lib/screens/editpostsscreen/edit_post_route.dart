import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider_advanced/models/viewmodels/posts_view_model.dart';
import 'package:provider_advanced/screens/editpostsscreen/edit_post_screen.dart';
import 'package:provider_advanced/repositories/postsrepository/posts_repository.dart';
import 'package:provider_advanced/repositories/postsrepository/posts_repository_impl.dart';
import 'package:provider_advanced/repositories/postsrepository/posts_service_impl.dart';

class EditPostRoute extends StatelessWidget {

  static const String routeName = 'editPostRoute';
  static const String viewModelKey = 'viewModelKey';
  static const String argsKey = 'argsKey';

  static Map buildRouteArguments({PostsViewModel viewModel, dynamic args}) {
    Map<String, dynamic> argsMap = {
      viewModelKey: viewModel,
      argsKey: args
    };

    return argsMap;
  }

  EditPostRoute();


  @override
  Widget build(BuildContext context) {
    final Map args = ModalRoute.of(context).settings.arguments;
    //if we're navigating from a screen that already has context of this viewmodel, we can choose to
    //pass it in and use the existing value down the tree (so we use value)
    if (args != null && args[viewModelKey] != null) {
      return ChangeNotifierProvider<PostsViewModel>.value(
        value: args[viewModelKey],
        child: EditPostScreen(),
      );
    }

    //if we're coming from a screen that does not have access to these dependencies, they will be
    //instantiated here (so we use create)
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
      child: EditPostScreen(),
    );
  }
}
