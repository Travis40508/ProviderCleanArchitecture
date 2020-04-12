import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_advanced/models/viewmodels/chuck_norris_facts_view_model.dart';
import 'package:provider_advanced/screens/chucknorrisfactsscreen/chuck_norris_facts_screen.dart';
import 'package:provider_advanced/repositories/chucknorrisrepository/chuck_norris_repository.dart';
import 'package:provider_advanced/repositories/chucknorrisrepository/chuck_norris_repository_impl.dart';
import 'package:provider_advanced/repositories/chucknorrisrepository/chuck_norris_service_impl.dart';

class ChuckNorrisFactsRoute extends StatelessWidget {
  static const String routeName = 'chuckNorrisFactsRoute';
  static const String viewModelKey = 'viewModelKey';
  static const String argsKey = 'argsKey';

  //here we can establish which dependencies we could expect for a given screen
  static Map buildRouteArguments({ChuckNorrisFactsViewModel viewModel, dynamic args}) {
    Map<String, dynamic> argsMap = {
      viewModelKey: viewModel,
      argsKey: args
    };

    return argsMap;
  }


  @override
  Widget build(BuildContext context) {
    final Map args = ModalRoute.of(context).settings.arguments;

    //if we're navigating from a screen that already has context of this viewmodel, we can choose to
    //pass it in and use the existing value down the tree (so we use value)
    if (args != null && args[viewModelKey] != null) {
      return ChangeNotifierProvider<ChuckNorrisFactsViewModel>.value(
        value: args[viewModelKey],
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
