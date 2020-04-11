

import 'models/post.dart';

abstract class PostsRepository {
  Future<List<Post>> fetchAllPosts();
}