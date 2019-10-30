import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:minhappteste/screens/blog/blog_post.dart';
import 'package:minhappteste/screens/blogs/blogs.dart';
import 'package:minhappteste/screens/location_detail/location_detail.dart';
import 'package:minhappteste/screens/movie/movie_search.dart';
import 'style.dart';
import 'screens/locations/locations.dart';
import 'models/posts.dart';

const MovieRoute = "/";
const BlogsRoute = '/blogs';
const LocationsRoute = '/locations';
const LocationDetailRoute = '/location_detail';
const BlogPostRoute = '/blog_post';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Post.getPosts();
    return MaterialApp(
      onGenerateRoute: _routes(),
      theme: _theme(),
    );
  }

  RouteFactory _routes() {
    return (settings) {
      final Map<String, dynamic> arguments = settings.arguments;
      Widget screen;
      switch (settings.name) {
        case MovieRoute:
          screen = MovieSearch();
          break;
        case BlogsRoute:
          screen = Blogs();
          break;
        case BlogPostRoute:
          screen = BlogPost(arguments['id']);
          break;
        case LocationsRoute:
          screen = Locations();
          break;
        case LocationDetailRoute:
          screen = LocationDetail(arguments['id']);
          break;
        default:
          return null;
      }
      return MaterialPageRoute(builder: (BuildContext context) => screen);
    };
  }

  ThemeData _theme() {
    return ThemeData(
      appBarTheme: AppBarTheme(
        textTheme: TextTheme(
          title: AppBarTextStyle,
        ),
      ),
      textTheme: TextTheme(
        title: TitleTextStyle,
        subtitle: SubTitleTextStyle,
        caption: CaptionTextStyle,
        body1: Body1TextStyle,
      ),
    );
  }
}
