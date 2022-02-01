import 'dart:convert';
import 'package:http/http.dart' as http;

class PostResult {
  // Buat variabel untuk menampung nilai json
  String id;
  String name;
  String job;
  String created;
  // Buat constuctor
  PostResult({this.id = '', this.name = '', this.job = '', this.created = ''});

  // Buat factory method yang berfungsi membuat object postResult tapi objeknya dari hasil maping json object
  factory PostResult.createPostResult(Map<String, dynamic> object) {
    return PostResult(
        id: object['id'],
        name: object['name'],
        job: object['job'],
        created: object['createdAt']);
  }

  // Buat function untuk connect ke API
  static Future<PostResult> connectToAPI(String name, String job) async {
    // Buat end point
    var apiURL = Uri.https('reqres.in', '/api/request');
    // Kirim data ke endpoint dengan method asynchrounus dan tampung ke dalam variabel apiResult
    var apiResult = await http.post(apiURL, body: {
      // Body berisi kumpulan parameter yang dibutuhkan endpoint
      "name": name,
      "job": job,
    });
    // Dapatkan bentuk json dari apiResult
    var jsonObject = json.decode(apiResult.body);
    // Kembalikan nilai ke object yang ada di PostResult.createdPostResult
    return PostResult.createPostResult(jsonObject);
  }
}
