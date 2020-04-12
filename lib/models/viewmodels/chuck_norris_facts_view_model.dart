

import 'package:flutter/material.dart';
import 'package:provider_advanced/models/chuck_norris_fact.dart';
import 'package:provider_advanced/repositories/chucknorrisrepository/chuck_norris_repository.dart';

class ChuckNorrisFactsViewModel extends ChangeNotifier {

  final ChuckNorrisRepository _chuckNorrisFactsRepository;
  final List<ChuckNorrisFact> _facts = [];
  List<ChuckNorrisFact> get facts => _facts;

  ChuckNorrisFactsViewModel(this._chuckNorrisFactsRepository);

  void fetchFact() async {
    final fact = await _chuckNorrisFactsRepository.fetchRandomChuckNorrisFact();
    _facts.add(fact);

    notifyListeners();
  }
}