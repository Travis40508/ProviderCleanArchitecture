

import 'package:flutter/material.dart';
import 'package:provider_advanced/repositories/postsrepository/models/post.dart';
import 'package:provider_advanced/repositories/postsrepository/posts_repository.dart';

class PostsViewModel extends ChangeNotifier {

  final List<Post> _posts = [];
  List<Post> get posts => _posts;

  final PostsRepository _postsRepository;

  PostsViewModel(this._postsRepository) {
    fetchPosts();
  }

  void fetchPosts() async {
    final posts = await _postsRepository.fetchAllPosts();
    _posts.addAll(posts);

    notifyListeners();
  }
}