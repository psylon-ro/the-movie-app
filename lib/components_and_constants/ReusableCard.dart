import 'package:flutter/material.dart';
import 'package:the_movie_app/Screens/details_screen.dart';
import 'package:the_movie_app/components_and_constants/modified_text.dart';

class ReusableCard extends StatelessWidget {
  final List? moviedatalist;
  final List? genrelist;
  ReusableCard({this.moviedatalist, this.genrelist});

  String genrenaming(int index) {
    List genre = [];

    for (int i in moviedatalist![index]['genre_ids']) {
      for (Map j in genrelist!) {
        if (i == j['id']) {
          genre.add(j['name']);
        }
      }
    }

    return genre.join(', ');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Scrollbar(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: moviedatalist!.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(
                        title: moviedatalist![index]['title'],
                        posterurl: 'https://image.tmdb.org/t/p/w500' +
                            moviedatalist![index]["poster_path"],
                        releasedate: moviedatalist![index]['release_date'],
                        ratings: moviedatalist![index]["vote_average"],
                        description: moviedatalist![index]['overview'],
                        popularity: moviedatalist![index]["popularity"]),
                  ),
                );
              },
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                margin: EdgeInsets.all(15),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        CircleAvatar(
                          radius: 50.0,
                          backgroundColor: Colors.black,
                          backgroundImage: NetworkImage(
                              'https://image.tmdb.org/t/p/w500' +
                                  moviedatalist![index]["poster_path"]),
                        ),
                        SizedBox(width: 50),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ModifiedText(
                              text: "Title: " + moviedatalist![index]['title'],
                              size: 20,
                              colour: Colors.black,
                            ),
                            ModifiedText(
                              text: 'Genre: ' + genrenaming(index),
                              size: 20,
                              colour: Colors.black,
                            )
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ModifiedText(
                          text: 'Ratings: ⭐️' +
                              moviedatalist![index]["vote_average"].toString(),
                          size: 20,
                          colour: Colors.black,
                        ),
                        SizedBox(
                          width: 40,
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
