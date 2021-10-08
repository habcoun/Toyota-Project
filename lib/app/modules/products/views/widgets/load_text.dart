import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoadText extends StatelessWidget {
  const LoadText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextLiquidFill(
      waveDuration: Duration(milliseconds: 1500),
      loadUntil: 0.75,
      text: '360°',
      waveColor: Color(0xFFB00000),
      boxBackgroundColor: Colors.grey.shade50,
      textStyle: GoogleFonts.poppins(
        fontSize: 40.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
