

import 'dart:convert';

import 'package:provider_advanced/models/chuck_norris_fact.dart';
import 'package:provider_advanced/repositories/chucknorrisrepository/chuck_norris_service.dart';
import 'package:http/http.dart' show Client;

class ChuckNorrisServiceImpl implements ChuckNorrisService {
  final Client client = Client();
  final _url = 'https://api.chucknorris.io/jokes/random';

  @override
  Future<ChuckNorrisFact> fetchRandomChuckNorrisFact() async {
    final res = await client.get(_url);
    final jsonRes = jsonDecode(res.body);

    print('fetching response from $_url');

    return ChuckNorrisFact.fromJson(jsonRes);
  }

}