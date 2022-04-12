import 'package:flutter/material.dart';
import 'package:moneyger_frontend/widgets/big_text.dart';

class Button extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color textColor;
  final double width;
  final double height;
  final void Function() onPressed;

  const Button({ Key? key, 
    required this.text, 
    this.bgColor = const Color(0xff46a2a2), 
    this.textColor = Colors.white, 
    this.width = double.infinity, 
    this.height = 45,
    required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(bgColor),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )
            )
          ),
          onPressed: onPressed,
          child: BigText(text: text, color: textColor, size: 17)
        )
    );
  }
}