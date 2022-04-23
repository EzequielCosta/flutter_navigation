import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:navigation_detail/entities/comments.dart';
import 'package:navigation_detail/widgets/comments_scroll_view_widget.dart';

class CommentsFutureBuilder extends StatelessWidget {
  final List<Comments> comments;
  final ScrollController scrollController;
  final int _limitPerPage = 20;
  final int _page = 1;
  final int postId;

  const CommentsFutureBuilder(
      {required this.scrollController,
      required this.comments,
      required this.postId,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final argsFromHome = ModalRoute.of(context)!.settings.arguments as DetailArguments;

    return FutureBuilder(
      future: fetchCommentsFromPosts(postId),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final comments = snapshot.data as List<Comments>;
          return CommentsScrollViewWidget(
            comments: comments,
            scrollController: scrollController,
          );
        }
        if (snapshot.hasError) {
          return const Text("Error");
        }
        return Container(
          padding: const EdgeInsets.only(bottom: 5),
          alignment: Alignment.center,
          child: const SizedBox(
            width: 40,
            height: 40,
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  Future<List<Comments>> fetchCommentsFromPosts(int postId) async {
    //await Future.delayed(Duration(seconds: 30));
    final response = await http.get(Uri.parse(
        'https://jsonplaceholder.typicode.com/comments?postId=$postId&_page=$_page&_limit=$_limitPerPage'));

    if (response.statusCode == 200) {
      List<Comments> comments = [];
      List<dynamic> commentsJson = jsonDecode(response.body);
      for (var comment in commentsJson) {
        comments.add(Comments.fromJson(comment));
      }
      return comments;
    } else {
      throw Exception('Failed to load Album');
    }
  }
}
