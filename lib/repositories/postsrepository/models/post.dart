

class Post {

  final userId;
  final id;
  final String title;
  final bool completed;

  Post.fromJson(Map<String, dynamic> parsedJson) :
        userId = parsedJson['userId'],
        id = parsedJson['id'],
        title = parsedJson['title'],
        completed = parsedJson['completed'];
}