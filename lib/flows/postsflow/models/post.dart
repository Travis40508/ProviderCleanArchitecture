

class Post {

  final userId;
  final id;
  String title;
  String body;
  final bool completed;

  Post.fromJson(Map<String, dynamic> parsedJson) :
        userId = parsedJson['userId'],
        id = parsedJson['id'],
        title = parsedJson['title'],
        body = parsedJson['body'],
        completed = parsedJson['completed'];
}