
import 'package:provider_advanced/models/chuck_norris_fact.dart';

abstract class ChuckNorrisRepository {

  Future<ChuckNorrisFact> fetchRandomChuckNorrisFact();
}