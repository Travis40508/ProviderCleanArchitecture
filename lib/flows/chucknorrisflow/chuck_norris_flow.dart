import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_advanced/flows/chucknorrisflow/models/viewmodels/chuck_norris_facts_view_model.dart';
import 'package:provider_advanced/flows/chucknorrisflow/screens/chuck_norris_facts_screen.dart';
import 'package:provider_advanced/repositories/chucknorrisrepository/chuck_norris_repository.dart';
import 'package:provider_advanced/repositories/chucknorrisrepository/chuck_norris_repository_impl.dart';
import 'package:provider_advanced/repositories/chucknorrisrepository/chuck_norris_service_impl.dart';

const String chuckNorrisFactsRouteName = 'facts/random';

class ChuckNorrisFlow extends StatelessWidget {

  final String routeName;

  ChuckNorrisFlow({this.routeName});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => ChuckNorrisServiceImpl(),
        ),
        ProxyProvider<ChuckNorrisServiceImpl, ChuckNorrisRepository>(
          update: (context, service, __) => ChuckNorrisRepositoryImpl(service),
        ),
        ChangeNotifierProvider<ChuckNorrisFactsViewModel>(
          create: (context) => ChuckNorrisFactsViewModel(Provider.of<ChuckNorrisRepository>(context, listen: false)),
        )
      ],
      child: Navigator(
        initialRoute: chuckNorrisFactsRouteName,
        onGenerateRoute: (RouteSettings settings) {
          WidgetBuilder builder;

          switch(settings.name?? routeName) {
            case chuckNorrisFactsRouteName:
              builder = (context) => ChuckNorrisFactsScreen();
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
