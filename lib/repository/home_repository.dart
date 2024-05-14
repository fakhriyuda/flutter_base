import 'package:base_project/data/model/posts.dart';
import 'package:base_project/services/network/network.dart';
import 'package:base_project/utils/locator.dart';

class HomeRepository {
  Network network = locator.get<Network>();

  Future<List<Posts>?> getPosts() async {
    try {
      final response = await network.get('/posts');
      switch (response.statusCode) {
        case 200:
          final List<Posts> posts = [];
          for (var item in response.data) {
            posts.add(Posts.fromJson(item));
          }
          return posts;
        default:
          throw Exception('Failed to load posts');
      }
    } catch (e) {
      rethrow;
    }
  }
}
