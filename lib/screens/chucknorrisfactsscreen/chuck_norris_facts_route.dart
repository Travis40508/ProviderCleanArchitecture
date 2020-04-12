import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_advanced/models/viewmodels/chuck_norris_facts_view_model.dart';
import 'package:provider_advanced/screens/chucknorrisfactsscreen/chuck_norris_facts_screen.dart';
import 'package:provider_advanced/repositories/chucknorrisrepository/chuck_norris_repository.dart';
import 'package:provider_advanced/repositories/chucknorrisrepository/chuck_norris_repository_impl.dart';
import 'package:provider_advanced/repositories/chucknorrisrepository/chuck_norris_service_impl.dart';

class ChuckNorrisFactsRoute extends StatelessWidget {
  static const String routeName = 'chuckNorrisFactsRoute';
  final ChuckNorrisFactsViewModel viewModel;

  ChuckNorrisFactsRoute({this.viewModel});

  @override
  Widget build(BuildContext context) {

    //if we're navigating from a screen that already has context of this viewmodel, we can choose to
    //pass it in and use the existing value down the tree (so we use value)
    if (viewModel != null) {
      return ChangeNotifierProvider<ChuckNorrisFactsViewModel>.value(
        value: viewModel,
        child: ChuckNorrisFactsScreen(),
      );
    }

    //if we're coming from a screen that does not have access to these dependencies, they will be
    //instantiated here (so we use create)
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => ChuckNorrisServiceImpl(),
        ),
        ProxyProvider<ChuckNorrisServiceImpl, ChuckNorrisRepository>(
          update: (context, service, __) => ChuckNorrisRepositoryImpl(service),
        ),
        ChangeNotifierProvider<ChuckNorrisFactsViewModel>(
          create: (context) => ChuckNorrisFactsViewModel(
              Provider.of<ChuckNorrisRepository>(context, listen: false)),
        )
      ],
      child: ChuckNorrisFactsScreen(),
    );
  }
}
