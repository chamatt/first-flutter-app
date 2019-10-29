import 'package:flutter/material.dart';
import 'package:minhappteste/widgets/location_tile.dart';
import '../../widgets/image_banner.dart';
import 'text_section.dart';
import "../../models/location.dart";

class LocationDetail extends StatelessWidget {
  final int _locationID;

  LocationDetail(this._locationID);

  @override
  Widget build(BuildContext context) {
    final location = Location.fetchByID(_locationID);

    return Scaffold(
        appBar: AppBar(
          title: Text(location.name),
          backgroundColor: Colors.red,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ImageBanner(assetPath: location.imagePath),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
                child: LocationTile(location: location),
              )
            ]..addAll(textSections(location)),
          ),
        ));
  }

  List<Widget> textSections(Location location) {
    return location.facts
        .map((fact) => TextSection(fact.title, fact.text))
        .toList();
  }
}
