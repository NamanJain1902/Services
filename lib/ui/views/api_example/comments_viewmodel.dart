import 'dart:convert';
import 'package:my_app/datamodels/comment.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;

class CommentsViewModel extends FutureViewModel<List<Comment>> {
  final int postId;
  CommentsViewModel(this.postId);

  @override
  Future<List<Comment>> futureToRun() async {
    var comments = List<Comment>();
    var response = await http
        .get('https://jsonplaceholder.typicode.com/comments?postId=$postId');
    var parsed = json.decode(response.body) as List<dynamic>;
    for (var comment in parsed) {
      comments.add(Comment.fromJson(comment));
    }
    return comments;
  }
}
