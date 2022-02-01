import 'package:api_demo/model/post_result.dart';
import 'package:flutter/material.dart';

class PostRequest extends StatefulWidget {
  const PostRequest({Key? key}) : super(key: key);

  @override
  _PostRequestState createState() => _PostRequestState();
}

class _PostRequestState extends State<PostRequest> {
  PostResult postResult = PostResult();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('POST Request')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(postResult.id != ''
                ? postResult.id +
                    " | " +
                    postResult.name +
                    " | " +
                    postResult.job +
                    " | " +
                    postResult.created
                : 'Data tidak ditemukan'),
            ElevatedButton(
                onPressed: () {
                  PostResult.connectToAPI('Yayak Yogi', 'FrontEnd Developer')
                      .then((value) {
                    postResult =
                        value; // ubah value dari postResult dengan hasil respon dari API
                    setState(
                        () {}); // refresh halaman untuk menampilkan data yang didapat dari API
                  });
                },
                child: Text('POST'))
          ],
        ),
      ),
    );
  }
}
