import 'model/posts_model.dart';
import 'package:http/http.dart' as http;

class Services {
  static Future<List<Posts>> getPosts() async {
    var url = "https://jsonplaceholder.typicode.com/posts";
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final List<Posts> listposts = postsFromJson(response.body);
      return listposts;
    } else {
      throw Exception("Failed to load data");
    }
  }
}
