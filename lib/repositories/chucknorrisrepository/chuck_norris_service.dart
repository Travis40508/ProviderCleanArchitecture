
import 'package:provider_advanced/models/chuck_norris_fact.dart';

abstract class ChuckNorrisService {
  Future<ChuckNorrisFact> fetchRandomChuckNorrisFact();
}