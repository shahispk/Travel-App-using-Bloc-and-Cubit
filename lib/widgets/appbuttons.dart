import 'package:flutter/material.dart';
import 'package:remainder/widgets/litetext.dart';

class AppButtons extends StatelessWidget {
  String? text;
  IconData? icon;
  bool? isIcon;
  final Color color;
  final Color bgcolor;
  double size;
  final Color bordercolor;
  AppButtons(
      {super.key,
      this.isIcon = false,
      this.text,
      this.icon,
      required this.size,
      required this.color,
      required this.bgcolor,
      required this.bordercolor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          border: Border.all(color: bordercolor, width: 1.0),
          borderRadius: BorderRadius.circular(15),
          color: bgcolor),
      child: isIcon == false
          ? Center(
              child: litetext(
              text: text!,
              color: color,
            ))
          : Center(
              child: Icon(
                icon,
                color: color,
              ),
            ),
    );
  }
}
