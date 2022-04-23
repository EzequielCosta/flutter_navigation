import 'package:flutter/material.dart';
import 'package:navigation_detail/entities/comments.dart';
import 'package:navigation_detail/widgets/comment_widget.dart';

class CommentsScrollViewWidget extends StatelessWidget {
  final List<Comments> comments;
  final ScrollController scrollController;

  const CommentsScrollViewWidget(
      {required this.scrollController, required this.comments, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: scrollController,
      padding: const EdgeInsets.all(8),
      itemCount: comments.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 300,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.amber
              //color: const Color.fromARGB(255, 79, 162, 204),
              ),
          child: CommentWidget(
            id: comments[index].id,
            name: comments[index].name,
            email: comments[index].email,
            body: comments[index].body,
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const SizedBox(
        height: 4,
      ),
    );
    //ListView(padding: EdgeInsets.all(8), children: widgets);
  }
}
