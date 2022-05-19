import 'package:flutter/material.dart';
import 'package:moneyger_frontend/widgets/big_text.dart';

class Button extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color textColor;
  final double textSize;
  final double width;
  final double height;
  final bool isLoading;
  final void Function() onPressed;

  const Button({ Key? key, 
    required this.text, 
    this.bgColor = const Color(0xff46a2a2), 
    this.textColor = const Color(0xffffffff),
    this.textSize = 17,
    this.width = double.infinity, 
    this.height = 45,
    this.isLoading = false,
    required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: FlatButton(
            padding: EdgeInsets.all(0),
            color: bgColor,
            onPressed: onPressed,
            child: isLoading ?
              SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(color: textColor, strokeWidth: 3)
              ) : 
              BigText(text: text, color: textColor, size: textSize)
          ),
      )
    );
  }
}