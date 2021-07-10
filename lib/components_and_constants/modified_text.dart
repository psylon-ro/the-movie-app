import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ModifiedText extends StatelessWidget {
  final String text;
  final double? size;
  final Color colour;

  ModifiedText({required this.text, this.size, required this.colour});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.breeSerif(
        fontSize: size,
        color: colour,
      ),
    );
  }
}
