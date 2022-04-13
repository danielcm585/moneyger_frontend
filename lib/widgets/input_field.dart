import 'package:flutter/material.dart';
import 'package:moneyger_frontend/utils/colors.dart';
import 'package:moneyger_frontend/widgets/small_text.dart';

class Input extends StatelessWidget {
  final String label;
  final String placeholder;
  final bool password;
  final void Function(String?)? validator;
  
  const Input({ Key? key,
    this.label = "",
    this.placeholder = "",
    this.password = false,
    this.validator
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // SmallText(text: label, size: 15, color: AppColor.black),
        TextFormField(
          obscureText: password,
          obscuringCharacter: '*',
          decoration: InputDecoration(
            hintText: placeholder,
            labelText: label, 
            focusColor: AppColor.teal
          ),
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return "This field cannot be emtpy";
            }
            return null;
          }, // FIXME: Change to custom func
        )
      ]
    );
  }
}