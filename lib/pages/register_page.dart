import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:moneyger_frontend/pages/login_page.dart';
import 'package:moneyger_frontend/widgets/button.dart';
import 'package:moneyger_frontend/widgets/input_field.dart';
import 'package:moneyger_frontend/utils/colors.dart';
import 'package:moneyger_frontend/widgets/big_text.dart';
import 'package:moneyger_frontend/widgets/small_text.dart';

class RegisterPage extends StatefulWidget {
  final setUser;

  const RegisterPage({ Key? key, 
    required this.setUser
  }) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _username, _email, _password;
  setUsername(String val) {
    setState(() { _username = val; });
  }
  setEmail(String val) {
    setState(() { _email = val; });
  }
  setPassword(String val) {
    setState(() { _password = val; });
  }

  @override
  Widget build(BuildContext context) {
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
                "assets/images/register.png",
                height: 250,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: "Register", color: AppColor.orange, size: 35),
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
                          label: "Email",
                          icon: Icons.mail_outline,
                          setState: setEmail,
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
                          text: "Register",
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              try {
                                final resp = await http.post(
                                  Uri.parse("https://moneyger-backend.dcm.my.id/user/register"),
                                  body: {
                                    'username': _username,
                                    'email': _email,
                                    'password': _password
                                  }
                                );
                                if (resp.statusCode >= 400) throw Exception("Register failed");
                                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                                //   return LoginPage(setUser: widget.setUser);
                                // }));
                              }
                              catch (err) {
                                log("BEUH");
                              }
                            }
                          }
                        ),
                      ]
                    ) 
                  ),
                ]
              ),
              SizedBox(height: 15),
              Button(
                text: "Login",
                bgColor: Colors.white,
                textColor: AppColor.teal,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return LoginPage(setUser: widget.setUser);
                  }));
                }
              ),
            ],
          ),
        )
      )
    );
  }
}