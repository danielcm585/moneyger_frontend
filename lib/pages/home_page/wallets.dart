import 'package:flutter/material.dart';
import 'package:moneyger_frontend/models/user.dart';
import 'package:moneyger_frontend/pages/new_wallet_page.dart';
import 'package:moneyger_frontend/utils/colors.dart';
import 'package:moneyger_frontend/widgets/big_text.dart';
import 'package:moneyger_frontend/widgets/button.dart';
import 'package:moneyger_frontend/widgets/wallet_card.dart';

class Wallets extends StatefulWidget {
  final User user;

  const Wallets({ Key? key,
    required this.user 
  }) : super(key: key);

  @override
  State<Wallets> createState() => _WalletsState();
}

class _WalletsState extends State<Wallets> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 50, left: 20, right: 20),
      child: Column(
        children: [
          BigText(text: "Wallets", color: AppColor.orange, size: 20),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: "My Wallets", size: 16),
                  SizedBox(height: 5),
                  BigText(text: widget.user.wallet!.length.toString(), size: 22),
                ]
              ),
              Button(
                text: "New Wallet", 
                textSize: 15,
                width: 120,
                height: 40,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return NewWalletPage(user: widget.user);
                  }));
                }
              )
            ]
          ),
          Column(
            children: widget.user.wallet?.map(
              (wallet) => WalletCard(wallet: wallet)
            ).toList() as List<Widget>
          )
        ]
      )
    );
  }
}