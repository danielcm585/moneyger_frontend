import 'package:flutter/material.dart';
import 'package:moneyger_frontend/widgets/big_text.dart';

class LinkButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final double textSize;
  final void Function() onPressed;

  const LinkButton({ Key? key, 
    required this.text, 
    this.textColor = const Color(0xff46a2a2), 
    this.textSize = 13,
    required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: BigText(text: text, color: textColor,)
    );
  }
}