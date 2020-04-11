import 'package:provider_advanced/flows/postsflow/models/post.dart';

abstract class PostsService {
  Future<List<Post>> fetchAllPosts();
}