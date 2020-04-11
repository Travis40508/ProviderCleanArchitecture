
import 'dart:convert';
import 'package:provider_advanced/flows/postsflow/models/post.dart';
import 'package:provider_advanced/repositories/postsrepository/posts_service.dart';
import 'package:http/http.dart' show Client;


class PostsServiceImpl implements PostsService {

  final Client client = Client();
  final baseUrl = 'https://jsonplaceholder.typicode.com/posts';

  @override
  Future<List<Post>> fetchAllPosts() async {
    final url = baseUrl;
    final res = await client.get(url);
    final Iterable resJson = jsonDecode(res.body);

    print('fetching response from $url');

    return resJson.map((post) => Post.fromJson(post)).toList();
  }

}
