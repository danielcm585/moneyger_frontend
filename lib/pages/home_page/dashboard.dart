import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:moneyger_frontend/models/user.dart';
import 'package:moneyger_frontend/pages/new_record_page.dart';
import 'package:moneyger_frontend/utils/colors.dart';
import 'package:moneyger_frontend/widgets/big_text.dart';
import 'package:moneyger_frontend/widgets/button.dart';

class Dashboard extends StatefulWidget {
  final User user;

  const Dashboard({ Key? key,
    required this.user 
  }) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 50, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DashboardTopBar(user: widget.user),
          SizedBox(height: 30),
          Container(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: "My Balance", size: 16),
                    SizedBox(height: 5),
                    BigText(text: "Rp "+widget.user.balance!.toString(), size: 22),
                  ],
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
              ],
            )
          ),
        ],
      )
    );
  }
}

class DashboardTopBar extends StatelessWidget {
  final User user;

  const DashboardTopBar({ Key? key,
    required this.user
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 41,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(width: 6),
              Container(
                width: 40, 
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(user.photo!),
                  )
                  // borderRadius: BorderRadius.circular(50),
                )
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: "Welcome Back!", size: 13),
                  SizedBox(height: 2),
                  BigText(text: user.username!, color: AppColor.orange, size: 19)
                ]
              )
            ]
          ),
          SizedBox(
            width: 35,
            height: 35,
            child: IconButton(
              padding: EdgeInsets.all(0),
              iconSize: 27,
              icon: Icon(Icons.notifications_none_outlined), 
              onPressed: () {
                log("open notification");
              }
            )
          )
        ]
      )
    );
  }
}