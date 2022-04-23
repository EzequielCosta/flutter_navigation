import 'package:flutter/material.dart';
import 'package:navigation_detail/entities/comments.dart';
import 'package:navigation_detail/entities/post.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:navigation_detail/pages/detail/detail_arguments.dart';
import 'package:navigation_detail/pages/detail/detail_page.dart';
import 'package:navigation_detail/widgets/comments_future_builder_widget.dart';
import 'package:navigation_detail/widgets/detail_post_widget.dart';

class DetailPageState extends State<DetailPage> {
  //late final Post post;
  List<Comments> comments = [];
  int page = 1;
  int limitPerPage = 20;
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final argsFromHome =
        ModalRoute.of(context)!.settings.arguments as DetailArguments;

    // fetchCommentsFromPosts(argsFromHome.postId);
    final CommentsFutureBuilder commentsFutureBuilder = CommentsFutureBuilder(
      scrollController: _scrollController,
      comments: comments,
      postId: argsFromHome.postId,
    );
    return FutureBuilder(
      future: fetchPosts(argsFromHome.postId),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final post = snapshot.data as Post;
          return Scaffold(
              appBar: AppBar(title: const Text("Post Detail")),
              body: DetailPostWidget(
                body: post.body,
                title: post.title,
                id: post.id,
                commentsFutureBuilder: commentsFutureBuilder,
              ));
        }
        if (snapshot.hasError) {
          return const Text("Error");
        }
        return Scaffold(
            appBar: AppBar(title: const Text("Post Detail")),
            body: Container(
              padding: const EdgeInsets.only(bottom: 5),
              alignment: Alignment.center,
              child: const SizedBox(
                width: 40,
                height: 40,
                child: CircularProgressIndicator(),
              ),
            ));
        //return const LoadingPage();
      },
    );
  }

  @override
  void initState() {
    super.initState();
    fetchPosts(1);
  }

  Future<Post> fetchPosts(int postId) async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/$postId'));

    if (response.statusCode == 200) {
      Map<String, dynamic> postJson = jsonDecode(response.body);
      Post post = Post.fromJson(postJson);
      return post;
    } else {
      throw Exception('Failed to load Album');
    }
  }
}
