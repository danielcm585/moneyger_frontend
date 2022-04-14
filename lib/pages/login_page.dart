import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:moneyger_frontend/pages/home_page.dart';
import 'package:moneyger_frontend/pages/register_page.dart';
import 'package:moneyger_frontend/widgets/button.dart';
import 'package:moneyger_frontend/widgets/input_field.dart';
import 'package:moneyger_frontend/widgets/big_text.dart';
import 'package:moneyger_frontend/models/user.dart';
import 'package:moneyger_frontend/utils/colors.dart';

class LoginPage extends StatefulWidget {
  final setUser;

  const LoginPage({ Key? key, 
    required this.setUser
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  
  String? _username, _password;
  setUsername(String value) {
    setState(() { _username = value; });
  }
  setPassword(String value) {
    setState(() { _password = value; });
  }
  
  @override
  Widget build(BuildContext context) {
    log("LOGIN");
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: 50, left: 25, right: 25),
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: [
              Image.asset(
                "assets/images/login.png",
                height: 250,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: "Login", color: AppColor.orange, size: 35),
                  SizedBox(height: 20),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Input(
                          label: "Username", 
                          icon: Icons.perm_identity_outlined,
                          setState: setUsername,
                          validator: (String? val) {
                            if (val == null || val.isEmpty) return "This field cannot be emtpy";
                            return null;
                          },
                        ),
                        SizedBox(height: 5),
                        Input(
                          label: "Password",
                          icon: Icons.lock_outline,
                          password: true,
                          setState: setPassword,
                          validator: (String? val) {
                            if (val == null || val.isEmpty) return "This field cannot be emtpy";
                            return null;
                          },
                        ),
                        SizedBox(height: 25),
                        Button(
                          text: "Login", 
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              try {
                                final resp = await http.post(
                                  Uri.parse("https://moneyger-backend.dcm.my.id/user/login"),
                                  body: {
                                    'username': _username,
                                    'password': _password
                                  }
                                );
                                if (resp.statusCode >= 400) throw Exception("Login failed");
                                final json = jsonDecode(utf8.decode(resp.bodyBytes)) as Map;
                                widget.setUser(User.fromJson(json));
                                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                                //   return HomePage();
                                // }));
                              }
                              catch (err) {
                                log("BEUH");
                              }
                            }
                          }
                        )
                      ]
                    ) 
                  ),
                ]
              ),
              SizedBox(height: 15),
              Button(
                text: "Register",
                bgColor: AppColor.white,
                textColor: AppColor.teal,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return RegisterPage(setUser: widget.setUser);
                  }));
                }
              )
            ],
          )
        )
      )
    );
  }
}