
class ChuckNorrisFact {
  final String iconUrl;
  final String jokeContent;

  ChuckNorrisFact.fromJson(Map<String, dynamic> parsedJson) :
      iconUrl = parsedJson['icon_url'],
      jokeContent = parsedJson['value'];
}