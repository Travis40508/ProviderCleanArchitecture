import 'package:provider_advanced/models/post.dart';

abstract class PostsService {
  Future<List<Post>> fetchAllPosts();
}