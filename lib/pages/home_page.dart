import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:moneyger_frontend/models/user.dart';
import 'package:moneyger_frontend/utils/colors.dart';
import 'package:moneyger_frontend/widgets/big_text.dart';
import 'package:moneyger_frontend/pages/login_page.dart';

class HomePage extends StatefulWidget {
  final User user;
  final setUser;

  const HomePage({ Key? key,
    required this.user,
    this.setUser
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          children: [
            BigText(text: "HOME"),
            BigText(text: widget.user.username!),
          ],
        )
      )
    );
  }
}