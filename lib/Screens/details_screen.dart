import 'package:flutter/material.dart';
import 'package:the_movie_app/components_and_constants/modified_text.dart';

class DetailsScreen extends StatelessWidget {
  final String title;
  final double ratings;
  final double popularity;
  final String description, posterurl, releasedate;
  DetailsScreen(
      {required this.title,
      required this.ratings,
      required this.posterurl,
      required this.releasedate,
      required this.popularity,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: ModifiedText(
            text: title,
            colour: Colors.white,
            size: 40,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 50),
        decoration: BoxDecoration(
          color: Colors.black,
        ),
        child: ListView(children: [
          SizedBox(height: 50),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    height: 230,
                    width: 180,
                    child: Image.network(posterurl),
                  ),
                  SizedBox(width: 50),
                  Container(
                    height: 230,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ModifiedText(
                            text: 'Release Date: $releasedate',
                            colour: Colors.white,
                            size: 25),
                        ModifiedText(
                            text: 'Ratings: ⭐️$ratings',
                            colour: Colors.white,
                            size: 25),
                        ModifiedText(
                            text: 'Popularity: $popularity',
                            colour: Colors.white,
                            size: 25),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ModifiedText(
                text: 'Description: ',
                colour: Colors.white,
                size: 25,
              ),
              Container(
                child: ModifiedText(
                    text: description, colour: Colors.white, size: 20),
              )
            ],
          )
        ]),
      ),
    );
  }
}
