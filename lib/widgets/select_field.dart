import 'package:flutter/material.dart';
import 'package:moneyger_frontend/models/user.dart';
import 'package:moneyger_frontend/models/wallet.dart';
import 'package:moneyger_frontend/utils/colors.dart';
import 'package:moneyger_frontend/widgets/button.dart';
import 'package:moneyger_frontend/widgets/small_text.dart';

class Select extends StatelessWidget {
  final List<String> items;
  final String text;
  final double width;
  final double height;
  final setValue;

  Select({ Key? key, 
    required this.items,
    required this.text,
    this.width = double.infinity,
    this.height = 45,
    required this.setValue
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Button(
      text: text,
      textColor: AppColor.black,
      bgColor: AppColor.white,
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return Container(
              height: 200,
              color: Colors.amber,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Text('Modal BottomSheet'),
                    ElevatedButton(
                      child: const Text('Close BottomSheet'),
                      onPressed: () => Navigator.pop(context),
                    )
                  ],
                ),
              ),
            );
          },
        );
      }
    );
  }
}