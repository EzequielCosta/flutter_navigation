import 'package:flutter/material.dart';

class CommentWidget extends StatelessWidget {
  final int id;
  final String name;
  final String email;
  final String body;

  const CommentWidget(
      {required this.id,
      required this.name,
      required this.email,
      required this.body,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          //padding: const EdgeInsets.all(8),
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                    //padding: EdgeInsets.all(1),
                    alignment: Alignment.center,
                    width: 50,
                    height: 35,
                    child: Text(
                      "ID: " + id.toString(),
                      style: const TextStyle(color: Colors.white),
                      //textAlign: TextAlign.center,
                    )),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          alignment: Alignment.center,
                          width: 50,
                          height: 25,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Text("Name")),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(name),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          alignment: Alignment.center,
                          width: 50,
                          height: 25,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Text("Email")),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(email),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          alignment: Alignment.center,
                          width: 80,
                          height: 25,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Text("Message")),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(body),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
