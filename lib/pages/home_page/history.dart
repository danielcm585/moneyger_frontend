import 'package:flutter/material.dart';
import 'package:moneyger_frontend/models/user.dart';
import 'package:moneyger_frontend/pages/new_record_page.dart';
import 'package:moneyger_frontend/utils/colors.dart';
import 'package:moneyger_frontend/widgets/big_text.dart';
import 'package:moneyger_frontend/widgets/button.dart';

class History extends StatefulWidget {
  final User user;

  const History({ Key? key,
    required this.user 
  }) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 50, left: 20, right: 20),
      child: Column(
        children: [
          BigText(text: "History", color: AppColor.orange, size: 20),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: "My Expenses", size: 16),
                  SizedBox(height: 5),
                  BigText(text: "Rp ", size: 22),
                ]
              ),
              Button(
                text: "New Record", 
                textSize: 15,
                width: 120,
                height: 40,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return NewRecordPage(user: widget.user);
                  }));
                }
              )
            ]
          )
        ]
      )
    );
  }
}