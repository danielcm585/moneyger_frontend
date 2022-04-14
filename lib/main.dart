import 'package:flutter/material.dart';
import 'package:moneyger_frontend/models/user.dart';
import 'package:moneyger_frontend/pages/home_page.dart';
import 'package:moneyger_frontend/pages/login_page.dart';
import 'package:moneyger_frontend/utils/colors.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({ Key? key }) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  User? _user;
  setUser(User val) {
    setState(() { _user = val; });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ThemeData().colorScheme.copyWith(primary: AppColor.teal),
        fontFamily: 'Lato'
      ),
      home: _user != null ? HomePage(user: _user!) : LoginPage(setUser: setUser)
    );
  }
}