import 'package:flutter/material.dart';
import 'package:moneyger_frontend/models/user.dart';
import 'package:moneyger_frontend/utils/colors.dart';
import 'package:moneyger_frontend/widgets/big_text.dart';
import 'package:moneyger_frontend/widgets/input_field.dart';
import 'package:moneyger_frontend/widgets/select_field.dart';

class NewWalletPage extends StatefulWidget {
  final User user;

  const NewWalletPage({ Key? key,
    required this.user 
  }) : super(key: key);

  @override
  State<NewWalletPage> createState() => _NewWalletPageState();
}

class _NewWalletPageState extends State<NewWalletPage> {
  String? _label, _type;
  setLabel(String val) => setState(() => _label = val);
  setType(String val) => setState(() => _type = val);
  
  final List<String> _types = ["Cash","E-Money","Bank Account","Credit Card"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 35,
                  height: 35,
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back_outlined)
                  ),
                ),
                BigText(text: "New Wallet", color: AppColor.orange, size: 20),
                SizedBox(height: 35, width: 35)
              ]
            ),
            SizedBox(height: 30),
            Input(
              icon: Icons.label_important_outline,
              label: "Wallet Name",
              setState: setLabel,
              validator: (String? val) {
                if (val == null || val.isEmpty) return "Can't be empty";
                return null;
              }
            ),
            SizedBox(height: 25),
            Select(
              text: "Choose wallet category",
              items: _types,
              setValue: setType,
            )
          ]
        )
      )
    );
  }
}