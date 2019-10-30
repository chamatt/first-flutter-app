import 'package:flutter/material.dart';
import 'package:minhappteste/models/movie.dart';
import 'package:minhappteste/screens/movie/movie_info.dart';

class MovieSearch extends StatefulWidget {
  _MovieSearchState createState() => _MovieSearchState();
}

class _MovieSearchState extends State<MovieSearch> {
  Movie movie;
  bool loading;
  final searchTermController = TextEditingController();

  void dispose() {
    searchTermController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Movie Search"),
          backgroundColor: Colors.red,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            !loading ? Text("Nao carregando") : Text("carregando"),
            buildRow(),
            loading
                ? Center(child: CircularProgressIndicator())
                : MovieInfo(movie)
          ],
        ));
  }

  Row buildRow() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: searchTermController,
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: 'Enter a search term'),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: Text("Search"),
                onPressed: () {
                  setState(() {
                    loading = true;
                  });

                  Movie.getMovie("Star Wars").then((movie) {
                    loading = false;
                    setState(() {
                      movie = movie;
                    });
                  }, onError: (err) {
                    print(err);
                  });
                },
              ),
            ),
          ),
        ]);
  }
}
