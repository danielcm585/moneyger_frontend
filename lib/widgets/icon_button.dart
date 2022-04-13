import 'package:flutter/material.dart';
import 'package:moneyger_frontend/utils/colors.dart';
import 'package:moneyger_frontend/widgets/small_text.dart';

class ColorIconButton extends StatelessWidget {
  final IconData icon;
  final String action;
  final Color? iconColor;
  final Color? bgColor;
  final Color? textColor;
  final double? size;

  const ColorIconButton({ Key? key,
    required this.icon,
    this.action = "",
    this.bgColor,
    this.iconColor = const Color(0xffffffff),
    this.textColor = const Color(0xff3a405a),
    this.size = 50
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Center(
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(15)
              ),
              child: Icon(icon, color: iconColor)
            )
          ),
          SizedBox(height: 5),
          SmallText(text: action, color: textColor)
        ],
      )
    );
  }
}