
import 'package:provider_advanced/repositories/postsrepository/posts_repository.dart';
import 'package:provider_advanced/repositories/postsrepository/posts_service.dart';

import 'models/post.dart';

class PostsRepositoryImpl implements PostsRepository {

  final PostsService _postsService;

  PostsRepositoryImpl(this._postsService);

  @override
  Future<List<Post>> fetchAllPosts() async {
    return await _postsService.fetchAllPosts();
  }

}