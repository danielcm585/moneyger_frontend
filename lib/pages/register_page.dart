import 'package:flutter/material.dart';
import 'package:moneyger_frontend/pages/login_page.dart';
import 'package:moneyger_frontend/widgets/button.dart';
import 'package:moneyger_frontend/widgets/input_field.dart';
import 'package:moneyger_frontend/models/user.dart';
import 'package:moneyger_frontend/utils/colors.dart';
import 'package:moneyger_frontend/widgets/big_text.dart';
import 'package:moneyger_frontend/widgets/small_text.dart';

class RegisterPage extends StatefulWidget {
  final User? user;

  const RegisterPage({ Key? key, 
    this.user
  }) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: 50, left: 25, right: 25),
        child: Column(
          children: [
            BigText(text: "Register", color: AppColor.orange, size: 22),
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
                    label: "Email",
                    placeholder: "my-email@gmail.com"
                  ),
                  SizedBox(height: 25),
                  Input(
                    label: "Password",
                    placeholder: "my_password",
                    password: true
                  ),
                  SizedBox(height: 25),
                  Button(
                    text: "Register",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // TODO: Create a new account
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return LoginPage();
                        }));
                      }
                    }
                  ),
                ]
              ) 
            ),
            SizedBox(height: 15),
            Button(
              text: "Login",
              bgColor: Colors.white,
              textColor: AppColor.teal,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LoginPage();
                }));
              }
            ),
          ],
        )
      )
    );
  }
}