import 'package:api_demo/model/get_result.dart';
import 'package:flutter/material.dart';

class GetRequest extends StatefulWidget {
  const GetRequest({Key? key}) : super(key: key);

  @override
  _GetRequestState createState() => _GetRequestState();
}

class _GetRequestState extends State<GetRequest> {
  GetResult getResult = GetResult();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GET Request')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(getResult.id != ''
                ? getResult.id + " | " + getResult.name
                : 'Data tidak ditemukan'),
            ElevatedButton(
                onPressed: () {
                  GetResult.connectToAPI('2').then((value) {
                    // ubah value dari postResult dengan hasil respon dari API
                    getResult = value;
                    // refresh halaman untuk menampilkan data yang didapat dari API
                    setState(() {});
                  });
                },
                child: Text('GET'))
          ],
        ),
      ),
    );
  }
}
