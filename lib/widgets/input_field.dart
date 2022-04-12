import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final String placeholder;
  
  const Input({ Key? key,
    this.placeholder = ""
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(hintText: placeholder)
    );
  }
}