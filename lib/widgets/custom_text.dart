import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final FontWeight weight;
  final TextOverflow overflow;
  final String maxLines;

  const CustomText(
      {Key key,
      this.text,
      this.size,
      this.color,
      this.weight,
      this.overflow,
      this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow ?? TextOverflow.ellipsis,
      maxLines: 2,
      style: TextStyle(
        fontSize: size ?? 16,
        color: color ?? Colors.black,
        fontWeight: weight ?? FontWeight.normal,
      ),
    );
  }
}

class CustomText2 extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final FontWeight weight;
  final TextOverflow overflow;
  final String maxLines;

  const CustomText2(
      {Key key,
      this.text,
      this.size,
      this.color,
      this.weight,
      this.overflow,
      this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow ?? TextOverflow.ellipsis,
      maxLines: 2,
      style: TextStyle(
        fontSize: size ?? 16,
        color: color ?? Colors.black,
        fontWeight: weight ?? FontWeight.normal,
      ),
    );
  }
}
