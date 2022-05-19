import 'package:flutter/material.dart';
import 'package:moneyger_frontend/utils/colors.dart';

class NumberInput extends StatelessWidget {
  final double width;
  final double height;
  final setValue;
  final validator;

  const NumberInput({ Key? key, 
    this.width = double.infinity,
    this.height = 60, 
    required this.setValue,
    required this.validator
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: TextFormField(
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          icon: Icon(Icons.attach_money_outlined),
          labelText: "Amount",
          border: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: AppColor.black),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: AppColor.teal),
            borderRadius: BorderRadius.circular(15),
          )
        ),
        onChanged: (String? val) { setValue(val); },
        validator: validator
      )
    );
  }
}