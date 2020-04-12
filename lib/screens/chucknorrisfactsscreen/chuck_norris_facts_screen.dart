import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_advanced/models/post.dart';
import 'package:provider_advanced/screens/editpostsscreen/edit_post_route.dart';
import 'package:provider_advanced/models/viewmodels/chuck_norris_facts_view_model.dart';

class ChuckNorrisFactsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        centerTitle: true,
        title: Text(
          'Chuck Norris Facts'
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add_circle),
            onPressed: () => Provider.of<ChuckNorrisFactsViewModel>(context, listen: false).fetchFact(),
          )
        ],
      ),
      body: Consumer<ChuckNorrisFactsViewModel> (
        builder: (_, viewModel, __) {
          return ListView.builder(
            itemCount: viewModel.facts.length,
            itemBuilder: (_, index) {
              final fact = viewModel.facts[index];

              return Card(
                elevation: 4.0,
                child: ListTile(
                  onTap: () => Navigator.pushNamed(context, EditPostRoute.routeName,
                  arguments: EditPostRoute.buildRouteArguments(
                    args: Post(userId: 1, id: 2, title: 'Random Fact', body: fact.jokeContent, completed: false))
                  ),
                  leading: Image(
                    image: CachedNetworkImageProvider(
                      fact.iconUrl
                    ),
                  ),
                  title: Text(
                    fact.jokeContent
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
