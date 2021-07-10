import 'package:flutter/material.dart';
import 'package:the_movie_app/components_and_constants/ReusableCard.dart';
import 'package:the_movie_app/components_and_constants/modified_text.dart';

class PopularList extends StatelessWidget {
  static String id = 'Popularlist';
  final String year;
  final List? listofmovies;
  final List? genrelist;

  PopularList({required this.year, this.listofmovies, this.genrelist});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: ModifiedText(
            text: 'The Popular Movies of $year',
            colour: Colors.white,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black,
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(children: [
          ReusableCard(moviedatalist: listofmovies, genrelist: genrelist)
        ]),
      ),
    );
  }
}
