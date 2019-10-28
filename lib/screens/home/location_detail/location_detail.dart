import 'package:flutter/material.dart';
import 'image_banner.dart';
import 'text_section.dart';

class LocationDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ImageBanner("assets/images/header.jpeg"),
          TextSection("Free Hong Kong", "This is a text"),
          TextSection("Free Hong Kong", "This is a text"),
          TextSection("Free Hong Kong", "This is a text"),
        ],
      ),
    );
  }
}
