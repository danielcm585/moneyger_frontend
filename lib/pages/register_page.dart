import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:moneyger_frontend/widgets/button.dart';
import 'package:moneyger_frontend/widgets/input_field.dart';
import 'package:moneyger_frontend/utils/colors.dart';
import 'package:moneyger_frontend/widgets/big_text.dart';
import 'package:moneyger_frontend/widgets/link_button.dart';
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
  bool _isLoading = false;
  setUsername(String val) => setState(() => _username = val);
  setEmail(String val) => setState(() => _email = val);
  setPassword(String val) => setState(() => _password = val);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: 50, left: 25, right: 25),
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: [
              SizedBox(height: 25),
              Row(
                children: [
                  SizedBox(width: 55),
                  SvgPicture.asset(
                    "assets/images/register.svg",
                    height: 260,
                  ),
                ],
              ),
              SizedBox(height: 25),
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
                          isLoading: _isLoading,
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              setState(() => _isLoading = true);
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
                                setState(() => _isLoading = false);
                                Navigator.pop(context, "Back to login");
                              }
                              catch (err) {
                                setState(() => _isLoading = false);
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SmallText(text: "Have an Account? ", size: 15, color: AppColor.teal),
                  LinkButton(
                    text: "Login",
                    textColor: AppColor.teal,
                    onPressed: () => Navigator.pop(context, "Back to login")
                  ),
                ],
              )
            ],
          ),
        )
      )
    );
  }
}