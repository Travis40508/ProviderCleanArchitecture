import 'package:provider_advanced/models/post.dart';

abstract class PostsRepository {
  Future<List<Post>> fetchAllPosts();
}