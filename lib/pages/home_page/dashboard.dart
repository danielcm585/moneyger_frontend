import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:moneyger_frontend/models/user.dart';
import 'package:moneyger_frontend/utils/colors.dart';
import 'package:moneyger_frontend/widgets/big_text.dart';

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
        children: [
          TopBar(user: widget.user),
          // BigText(text: "HOME"),
          // BigText(text: widget.user.username!),
        ],
      )
    );
  }
}

class TopBar extends StatelessWidget {
  final User user;

  const TopBar({ Key? key,
    required this.user
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(width: 6),
              SizedBox(
                width: 40, 
                height: 40,
                child: Image.network(user.photo!),
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
            child: 
            IconButton(
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