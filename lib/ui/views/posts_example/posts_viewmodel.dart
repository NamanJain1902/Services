import 'package:my_app/datamodels/post.dart';
import 'package:stacked/stacked.dart';

class PostsViewModel extends FutureViewModel<List<Post>> {
  @override
  Future<List<Post>> futureToRun() => Future.value();
}
