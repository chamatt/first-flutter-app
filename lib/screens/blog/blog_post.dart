import 'package:flutter/material.dart';
import 'package:minhappteste/models/posts.dart';
import 'package:minhappteste/screens/location_detail/text_section.dart';

class BlogPost extends StatelessWidget {
  final int _blogID;

  BlogPost(this._blogID);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Post.getPost(id: _blogID),
      builder: (context, snapshot) {
        bool loading = (snapshot.connectionState != ConnectionState.done);

        return Scaffold(
            appBar: AppBar(
              title: Text("teste"),
              backgroundColor: Colors.red,
            ),
            body: loading
                ? Center(child: CircularProgressIndicator())
                : snapshot.hasError
                    ? InkWell(
                        child: Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: Text("ERROR OCCURRED, Tap to retry !"),
                        ),
                        onTap: () => {},
                      )
                    : TextSection(snapshot.data.title, snapshot.data.body));
      },
    );
  }

  Widget switchCase({bool condition, Widget ifTrue, Widget ifFalse}) {
    if (condition) {
      return ifTrue;
    } else {
      return ifFalse;
    }
  }
}
