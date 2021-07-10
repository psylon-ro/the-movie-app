import 'package:flutter/material.dart';
import 'package:the_movie_app/components_and_constants/modified_text.dart';

class RoundedButton extends StatelessWidget {
  final Color colour;
  final String buttontitle;
  final onPressed;

  RoundedButton(
      {required this.colour,
      required this.buttontitle,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
            onPressed: onPressed,
            minWidth: 300.0,
            height: 60.0,
            child: ModifiedText(
              text: buttontitle,
              size: 20,
              colour: Colors.white,
            )),
      ),
    );
  }
}
