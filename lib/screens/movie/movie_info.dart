import 'package:flutter/material.dart';
import 'package:minhappteste/models/movie.dart';

class MovieInfo extends StatelessWidget {
  final Movie movie;

  MovieInfo(this.movie);

  @override
  Widget build(BuildContext context) {
    // print(movie.title ?? "Nulo");
    return Container(
      padding: EdgeInsets.only(top: 100.0),
      child: movie == null
          ? Center(
              child: Text("Search for a movie"),
            )
          : Column(
              children: <Widget>[Text(movie.title), Text(movie.genre)],
            ),
    );
  }
}
