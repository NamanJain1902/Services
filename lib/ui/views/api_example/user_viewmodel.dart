import 'dart:convert';
import 'package:my_app/datamodels/user.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;

class UserViewModel extends FutureViewModel<User> {
  final int userId;
  UserViewModel(this.userId);

  @override
  Future<User> futureToRun() async {
    var response =
        await http.get('https://jsonplaceholder.typicode.com/users/$userId');
    return User.fromJson(json.decode(response.body));
  }
}
