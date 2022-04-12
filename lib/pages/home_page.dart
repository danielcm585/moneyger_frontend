import 'package:flutter/material.dart';
import '../models/user.dart';
import '../utils/colors.dart';
import '../widgets/big_text.dart';
import './login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = User;

  @override
  Widget build(BuildContext context) {
    if (user != null) return LoginPage();
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          children: [
            
          ],
        )
      )
    );
  }
}