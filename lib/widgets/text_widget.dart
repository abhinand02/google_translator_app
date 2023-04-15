import 'package:flutter/material.dart';
import 'package:google_translator/constants/constants.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
      {super.key, required this.text, this.fontSize, this.fontWeight});

  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontSize, fontWeight: fontWeight, color: whiteClr),
    );
  }
}
