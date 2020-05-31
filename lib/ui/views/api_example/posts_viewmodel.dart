import 'dart:convert';
import 'package:my_app/datamodels/post.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;

class PostsViewModel extends FutureViewModel<List<Post>> {
  final int userId;
  PostsViewModel(this.userId);

  @override
  Future<List<Post>> futureToRun() async {
    var posts = List<Post>();
    var response = await http
        .get('https://jsonplaceholder.typicode.com/posts?userId=$userId');
    var parsed = json.decode(response.body) as List<dynamic>;
    for (var post in parsed) {
      posts.add(Post.fromJson(post));
    }

    return posts;
  }
}
