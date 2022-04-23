import 'package:flutter/material.dart';
import 'package:navigation_detail/entities/post.dart';
import 'package:navigation_detail/pages/detail/detail_arguments.dart';
import 'package:navigation_detail/widgets/post_widget.dart';

class PostScrollViewWidget extends StatelessWidget {
  final List<Post> posts;
  final ScrollController scrollController;

  const PostScrollViewWidget(
      {required this.scrollController, required this.posts, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: scrollController,
      padding: const EdgeInsets.all(8),
      itemCount: posts.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
            onTap: () => Navigator.pushNamed(context, "/detail",
                arguments: DetailArguments(postId: posts[index].id)),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 79, 162, 204),
              ),
              child: PostWidget(
                id: posts[index].id,
                title: posts[index].title,
              ),
            ));
      },
      separatorBuilder: (BuildContext context, int index) => const SizedBox(
        height: 4,
      ),
    );
    // ListView(padding: EdgeInsets.all(8), children: widgets);
  }
}
