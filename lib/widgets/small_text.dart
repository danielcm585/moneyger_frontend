import 'package:flutter/material.dart';
import 'package:moneyger_frontend/utils/colors.dart';

class SmallText extends StatelessWidget {
  final String text;
  final Color? color;
  final double size;
  final TextOverflow overflow;

  const SmallText({ Key? key,
    required this.text,
    this.color = Colors.grey,
    this.size = 12,
    this.overflow = TextOverflow.ellipsis
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontSize: size,
      )
    );
  }
}