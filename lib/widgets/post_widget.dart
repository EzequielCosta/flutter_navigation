import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  final int id;
  final String title;

  const PostWidget({required this.id, required this.title, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Container(
                alignment: Alignment.center, child: Text(id.toString()))),
        Expanded(flex: 4, child: Text(title))
      ],
    );
  }
}
