import 'dart:convert';
import 'package:http/http.dart' as http;

class UpdateResult {
  String name;
  String job;
  String updatedAt;

  UpdateResult({this.name = '', this.job = '', this.updatedAt = ''});

  factory UpdateResult.updateData(Map<String, dynamic> object) {
    return UpdateResult(
        name: object['name'],
        job: object['job'],
        updatedAt: object['updatedAt']);
  }

  static Future<UpdateResult> connectToAPI(
    String id,
    String name,
    String job,
  ) async {
    var apiURL = Uri.https('reqres.in', '/api/users/' + id);
    var apiResult = await http.put(apiURL, body: {
      "name": name,
      "job": job,
    });
    var jsonObject = json.decode(apiResult.body);
    return UpdateResult.updateData(jsonObject);
  }
}
