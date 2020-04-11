import 'package:provider_advanced/flows/postsflow/models/post.dart';

abstract class PostsRepository {
  Future<List<Post>> fetchAllPosts();
}