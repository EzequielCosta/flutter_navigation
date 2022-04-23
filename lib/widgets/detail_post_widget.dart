import 'package:flutter/material.dart';
import 'package:navigation_detail/widgets/comments_future_builder_widget.dart';

class DetailPostWidget extends StatelessWidget {
  final int id;
  final String title;
  final String body;
  final CommentsFutureBuilder commentsFutureBuilder;

  const DetailPostWidget(
      {required this.body,
      required this.title,
      required this.id,
      required this.commentsFutureBuilder,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 221, 218, 218),
                      borderRadius: BorderRadius.circular(30)),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  alignment: Alignment.center,
                                  width: 90,
                                  height: 35,
                                  //color: Color.fromARGB(255, 221, 218, 218),
                                  decoration: BoxDecoration(
                                      color: Colors.orangeAccent,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Text("ID ${id.toString()}",
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold))),
                            ),
                          ],
                        ),
                        const Text("Title",
                            style: TextStyle(
                              color: Colors.orange,
                              fontSize: 20,
                            )),
                        Center(child: Text(title)),
                        const Text("Body",
                            style: TextStyle(
                              color: Colors.orange,
                              fontSize: 20,
                            )),
                        Center(child: Text(body)),
                      ])),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              //color: Colors.amber,
              child: Column(children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  width: 200,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color.fromARGB(255, 79, 162, 204),
                    //color: Colors.orangeAccent,
                  ),
                  child: const Text(
                    "Comentários",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  ),
                ),
                commentsFutureBuilder,
              ]),
            )
          ],
        )
      ],
    );
  }
}
