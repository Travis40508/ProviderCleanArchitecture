import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider_advanced/models/viewmodels/posts_view_model.dart';
import 'package:provider_advanced/screens/editpostsscreen/edit_post_screen.dart';
import 'package:provider_advanced/repositories/postsrepository/posts_repository.dart';
import 'package:provider_advanced/repositories/postsrepository/posts_repository_impl.dart';
import 'package:provider_advanced/repositories/postsrepository/posts_service_impl.dart';

class EditPostRoute extends StatelessWidget {

  static const String routeName = 'editPostRoute';

  final PostsViewModel viewModel;
  EditPostRoute({this.viewModel});

  @override
  Widget build(BuildContext context) {
    if (viewModel != null) {
      return ChangeNotifierProvider<PostsViewModel>.value(
        value: viewModel,
        child: EditPostScreen(),
      );
    }
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
