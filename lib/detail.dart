import 'package:api_demo/model/get_all_result.dart';
import 'package:api_demo/model/update_result.dart';
import 'package:api_demo/widget/button_action_widget.dart';
import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  final GetAllResult getAllResult;
  const Detail(this.getAllResult, {Key? key}) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  UpdateResult updateResult = UpdateResult();
  bool isAnyUpdateData = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil')),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              const SizedBox(height: 15),
              Column(children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    widget.getAllResult.imageUrl,
                    width: 100,
                    height: 100,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  widget.getAllResult.firstName +
                      " " +
                      widget.getAllResult.lastName,
                  style: const TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 20),
                ),
                const SizedBox(height: 5),
                Text(
                  widget.getAllResult.email,
                  style: const TextStyle(fontSize: 15),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonAction(
                        icon: Icons.edit,
                        title: 'Edit',
                        onPress: () {
                          setState(() {
                            isAnyUpdateData = true;
                          });
                          UpdateResult.connectToAPI(widget.getAllResult.id,
                                  'morpheus', 'zion resident')
                              .then((value) {
                            updateResult = value;
                            setState(() {
                              isAnyUpdateData = false;
                            });
                          });
                        }),
                    const SizedBox(width: 5),
                  ],
                )
              ]),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 1,
                color: Colors.blueAccent,
              ),
              const SizedBox(height: 30),
              Text(updateResult.name != ''
                  ? updateResult.name +
                      " | " +
                      updateResult.job +
                      " | " +
                      updateResult.updatedAt
                  : ''),
              const SizedBox(height: 20),
              Center(
                child: isAnyUpdateData
                    ? Column(
                        children: const [
                          CircularProgressIndicator(),
                          SizedBox(height: 10),
                          Text('Loading'),
                        ],
                      )
                    : Container(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
