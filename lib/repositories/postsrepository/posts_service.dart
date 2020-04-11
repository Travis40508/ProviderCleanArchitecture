


import 'models/post.dart';

abstract class PostsService {
  Future<List<Post>> fetchAllPosts();
}