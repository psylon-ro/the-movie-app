import 'package:flutter/material.dart';
import 'package:the_movie_app/Screens/year_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
            brightness: Brightness.dark,
            primaryColor: Colors.black,
            scaffoldBackgroundColor: Colors.black),
        home: YearScreen());
  }
}
