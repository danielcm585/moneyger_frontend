import 'package:flutter/material.dart';
import 'package:moneyger_frontend/utils/colors.dart';

class Navbar extends StatelessWidget {
  final int currentPage;
  final setPage;

  const Navbar({ Key? key,
    required this.currentPage,
    required this.setPage
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: "Home"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: "History"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_balance_wallet_outlined),
          label: "Wallets"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_outlined),
          label: "Profile",
        ),
      ],
      currentIndex: currentPage,
      selectedItemColor: AppColor.teal,
      unselectedItemColor: AppColor.black,
      onTap: (int idx) { setPage(idx); }
    );
  }
}