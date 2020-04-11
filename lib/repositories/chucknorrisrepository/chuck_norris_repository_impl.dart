

import 'package:provider_advanced/flows/chucknorrisflow/models/chuck_norris_fact.dart';
import 'package:provider_advanced/repositories/chucknorrisrepository/chuck_norris_repository.dart';
import 'package:provider_advanced/repositories/chucknorrisrepository/chuck_norris_service.dart';

class ChuckNorrisRepositoryImpl implements ChuckNorrisRepository {

  final ChuckNorrisService _chuckNorrisService;

  ChuckNorrisRepositoryImpl(this._chuckNorrisService);

  @override
  Future<ChuckNorrisFact> fetchRandomChuckNorrisFact() async {
    return await _chuckNorrisService.fetchRandomChuckNorrisFact();
  }

}