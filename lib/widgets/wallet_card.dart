import 'package:flutter/material.dart';
import 'package:moneyger_frontend/models/wallet.dart';
import 'package:moneyger_frontend/widgets/big_text.dart';

class WalletCard extends StatelessWidget {
  final Wallet wallet;

  const WalletCard({ Key? key,
    required this.wallet
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        
      ),
      child: Column(
        children: [
          BigText(text: wallet.label!)
        ]
      )
    );
  }
}