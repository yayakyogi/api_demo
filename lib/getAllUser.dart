import 'package:api_demo/model/get_all_result.dart';
import 'package:api_demo/widget/list_card_widget.dart';
import 'package:flutter/material.dart';

class GetAllUser extends StatefulWidget {
  const GetAllUser({Key? key}) : super(key: key);

  @override
  _GetAllUserState createState() => _GetAllUserState();
}

class _GetAllUserState extends State<GetAllUser> {
  GetAllResult getAllResult = GetAllResult();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('REQ | RES')),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            FutureBuilder(
                future: getAllResult.getUser(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<GetAllResult> data =
                        snapshot.data as List<GetAllResult>;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ElevatedButton(
                            onPressed: () {}, child: const Text('Tambah User')),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: data.map((item) {
                              return ListCard(item);
                            }).toList()),
                      ],
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                })
          ],
        ),
      ),
    );
  }
}
