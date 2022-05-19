import 'package:flutter/material.dart';
import 'package:moneyger_frontend/models/user.dart';
import 'package:moneyger_frontend/models/wallet.dart';
import 'package:moneyger_frontend/utils/colors.dart';
import 'package:moneyger_frontend/widgets/big_text.dart';
import 'package:moneyger_frontend/widgets/number_input_field.dart';
import 'package:moneyger_frontend/widgets/select_field.dart';

class NewRecordPage extends StatefulWidget {
  final User user;

  const NewRecordPage({ Key? key,
    required this.user
  }) : super(key: key);

  @override
  State<NewRecordPage> createState() => _NewRecordPageState();
}

class _NewRecordPageState extends State<NewRecordPage> {
  String? _amount, _wallet = "Cash";
  setAmount(val) => setState(() => _amount = val);
  setWallet(val) => setState(() => _wallet = val);

  bool isNumeric(String s) {
    if (s == null) return false;
    return double.tryParse(s) != null;
  }

  @override
  Widget build(BuildContext context) {
    final List<String> _wallets = widget.user.wallet!.map((Wallet wallet) => wallet.label) as List<String>;

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
                BigText(text: "New Record", color: AppColor.orange, size: 20),
                SizedBox(height: 35, width: 35)
              ]
            ),
            SizedBox(height: 30),
            BigText(text: "Current Balance:", size: 18),
            BigText(text: widget.user.balance!.toString(), size: 25),
            NumberInput(
              setValue: setAmount, 
              validator: (String? val) {
                if (val == null || val.isEmpty) return "Amount can't be empty";
                if (isNumeric(val)) return "Amount must be number";
                return null;
              }
            ),
            // Select(
            //   items: _wallets,
            //   setValue: setWallet
            // )
          ]
        )
      )
    );
  }
}