import 'package:flutter/material.dart';
import 'package:moneyger_frontend/utils/colors.dart';

class BigText extends StatelessWidget {
  final String text;
  final Color? color;
  final double size;

  const BigText({ Key? key,
    required this.text,
    this.color = const Color(0xff403d58),
    this.size = 17
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.bold
      )
    );
  }
}