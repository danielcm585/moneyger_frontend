import 'package:flutter/material.dart';
import '../models/user.dart';
import '../utils/colors.dart';
import '../widgets/big_text.dart';

class LoginPage extends StatefulWidget {
  final User? user;

  const LoginPage({ Key? key, 
    this.user
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          children: [
            BigText(text: "Login", color: AppColor.orange, size: 22),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  
                ]
              )
            )
          ],
        )
      )
    );
  }
}