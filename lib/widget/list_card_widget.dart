import 'package:api_demo/detail.dart';
import 'package:api_demo/model/get_all_result.dart';
import 'package:api_demo/widget/button_action_widget.dart';
import 'package:flutter/material.dart';

class ListCard extends StatelessWidget {
  final GetAllResult getAllResult;

  const ListCard(this.getAllResult, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: Colors.blueAccent)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(35),
                child: Image.network(
                  getAllResult.imageUrl,
                  width: 75,
                  height: 75,
                ),
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    getAllResult.firstName + " " + getAllResult.lastName,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 18),
                  ),
                  const SizedBox(height: 5),
                  Text(getAllResult.email),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ButtonAction(
                          icon: Icons.visibility,
                          title: 'Detail',
                          onPress: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                        Detail(getAllResult))));
                          }),
                    ],
                  )
                ],
              ),
              const Spacer(),
            ],
          )
        ],
      ),
    );
  }
}
