import 'package:flutter/material.dart';
import 'package:navigation_detail/pages/home/home_page.dart';
import 'package:navigation_detail/entities/post.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:navigation_detail/widgets/circular_progress_indicator_listview_widget.dart';
import 'package:navigation_detail/widgets/posts_scroll_view_widget.dart';

class HomePageState extends State<HomePage> {
  List<Post> posts = [];
  int page = 1;
  int limitPerPage = 20;
  late final ScrollController _scrollController;
  bool _loading = true;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
    _scrollController.addListener(() => {
          if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent)
            {fetchPosts()}
        });

    fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("List Post")),
      body: Center(
          child: Stack(
        children: <Widget>[
          PostScrollViewWidget(
            scrollController: _scrollController,
            posts: posts,
          ),
          if (_loading) ...[
            CircularProgressIndicatorListView(
              alignment:
                  (page == 1 ? Alignment.center : Alignment.bottomCenter),
            )
          ],
        ],
      )),
    );
  }

  Future<void> fetchPosts() async {
    setState(() {
      _loading = true;
    });
    final response = await http.get(Uri.parse(
        'https://jsonplaceholder.typicode.com/posts?_page=$page&_limit=$limitPerPage'));

    if (response.statusCode == 200) {
      List<dynamic> postJson = jsonDecode(response.body);

      setState(() {
        postJson.forEach((element) => {posts.add(Post.fromJson(element))});
        page++;
        _loading = false;
      });
    } else {
      throw Exception('Failed to load Album');
    }
  }
}
