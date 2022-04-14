import 'package:flutter/material.dart';
import 'package:moneyger_frontend/utils/colors.dart';

class Input extends StatelessWidget {
  final String label;
  final IconData? icon;
  final String placeholder;
  final bool password;
  final validator;
  final setState;
  
  const Input({ Key? key,
    this.label = "",
    this.icon,
    this.placeholder = "",
    this.password = false,
    required this.validator,
    required this.setState
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      child: TextFormField(
        obscureText: password,
        obscuringCharacter: '*',
        // keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          icon: Icon(icon),
          // iconColor: AppColor.teal,
          hintText: placeholder,
          labelText: label,
          // floatingLabelStyle: TextStyle(color: AppColor.teal),
          // focusedBorder: UnderlineInputBorder(
          //   borderSide: BorderSide(color: AppColor.teal)
          // ),
        ),
        onChanged: (String? val) { setState(val); },
        validator: validator
      )
    );
  }
}