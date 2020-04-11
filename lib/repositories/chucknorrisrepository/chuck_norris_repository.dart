
import 'package:provider_advanced/flows/chucknorrisflow/models/chuck_norris_fact.dart';

abstract class ChuckNorrisRepository {

  Future<ChuckNorrisFact> fetchRandomChuckNorrisFact();
}