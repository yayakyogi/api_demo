import 'dart:convert';
import 'package:http/http.dart' as http;

class GetAllResult {
  late String id;
  late String firstName;
  late String lastName;
  late String email;
  late String imageUrl;

  GetAllResult(
      {this.id = '',
      this.firstName = '',
      this.lastName = '',
      this.imageUrl = ''});

  GetAllResult.fromJson(json) {
    id = json['id'].toString();
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    imageUrl = json['avatar'];
  }

  getUser() async {
    var urlApi = Uri.http('reqres.in', '/api/users/');
    var response = await http.get(urlApi);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var userData = (data as Map<String, dynamic>)['data'];
      List userAll = userData;
      List<GetAllResult> users =
          userAll.map((item) => GetAllResult.fromJson(item)).toList();
      return users;
    } else {
      <GetAllResult>[];
    }
  }
}
