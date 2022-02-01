import 'dart:convert';
import 'package:http/http.dart' as http;

class GetResult {
  String id;
  String name;

  GetResult({this.id = '', this.name = ''});

  factory GetResult.getDataResult(Map<String, dynamic> object) {
    return GetResult(
        id: object['id'].toString(),
        name: object['first_name'] + " " + object['last_name']);
  }

  static Future<GetResult> connectToAPI(String id) async {
    // kirim end point dengan parameter id user
    var apiUrl = Uri.http('reqres.in', '/api/users/' + id);
    // method get untuk mendapatkan data user berdasarkan id
    var apiResult = await http.get(apiUrl);
    // decode respon json
    var jsonObject = json.decode(apiResult.body);
    // mapping respon yang berada pada json dengan key data
    var userData = (jsonObject as Map<String, dynamic>)['data'];

    return GetResult.getDataResult(userData);
  }
}
