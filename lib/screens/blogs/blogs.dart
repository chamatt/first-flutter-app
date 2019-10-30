import 'package:flutter/material.dart';
import 'package:minhappteste/app.dart';
import 'package:minhappteste/models/posts.dart';
import 'package:minhappteste/screens/location_detail/text_section.dart';

class Blogs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Blog"),
      ),
      body: FutureBuilder(
        future: Post.getPosts(),
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              Post post = snapshot.data[index];
              return GestureDetector(
                  onTap: () => _onBlogPostTap(context, post.id),
                  child: TextSection(post.title, post.body));
            },
          );
        },
      ),
    );
  }

  _onBlogPostTap(BuildContext context, int id) {
    Navigator.pushNamed(
      context,
      BlogPostRoute,
      arguments: {'id': id},
    );
  }
}
