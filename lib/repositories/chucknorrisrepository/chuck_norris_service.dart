
import 'package:provider_advanced/flows/chucknorrisflow/models/chuck_norris_fact.dart';

abstract class ChuckNorrisService {
  Future<ChuckNorrisFact> fetchRandomChuckNorrisFact();
}