import 'package:flutter/material.dart';
import 'package:moneyger_frontend/pages/home_page.dart';
import 'package:moneyger_frontend/pages/register_page.dart';
import 'package:moneyger_frontend/widgets/button.dart';
import 'package:moneyger_frontend/widgets/input_field.dart';
import 'package:moneyger_frontend/models/user.dart';
import 'package:moneyger_frontend/utils/colors.dart';
import 'package:moneyger_frontend/widgets/big_text.dart';
import 'package:moneyger_frontend/widgets/small_text.dart';

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
        padding: EdgeInsets.only(top: 50, left: 25, right: 25),
        child: Column(
          children: [
            BigText(text: "Login", color: AppColor.orange, size: 22),
            SizedBox(height: 50),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Input(
                    label: "Username",
                    placeholder: "my_username"
                  ),
                  SizedBox(height: 25),
                  Input(
                    label: "Password",
                    placeholder: "my_password",
                    password: true
                  ),
                  SizedBox(height: 25),
                  Button(
                    text: "Login", 
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // TODO: Login Request
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return HomePage();
                        }));
                      }
                    }
                  )
                ]
              ) 
            ),
            SizedBox(height: 15),
            Button(
              text: "Register",
              bgColor: Colors.white,
              textColor: AppColor.teal,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return RegisterPage();
                }));
              }
            )
          ],
        )
      )
    );
  }
}