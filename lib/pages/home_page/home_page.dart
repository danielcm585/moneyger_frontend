import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:moneyger_frontend/models/user.dart';
import 'package:moneyger_frontend/pages/home_page/dashboard.dart';
import 'package:moneyger_frontend/pages/home_page/history.dart';
import 'package:moneyger_frontend/pages/home_page/profile.dart';
import 'package:moneyger_frontend/pages/home_page/wallets.dart';
import 'package:moneyger_frontend/utils/colors.dart';

class HomePage extends StatefulWidget {
  final User user;
  final setUser;

  const HomePage({ Key? key,
    required this.user,
    this.setUser
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 0;
  setPage(int idx) => setState(() => _currentPage = idx);

  @override
  Widget build(BuildContext context) {
    List<Widget> _pages = [
      Dashboard(user: widget.user),
      History(user: widget.user),
      Wallets(user: widget.user),
      Profile(user: widget.user),
    ];

    // List<PreferredSizeWidget> _topBars = [
    //   DashboardTopBar(user: widget.user),
    // ];

    return Scaffold(
      // appBar: _topBars.elementAt(_currentPage),
      body: _pages.elementAt(_currentPage),
      bottomNavigationBar: Navbar(currentPage: _currentPage, setPage: setPage),
    );
  }
}

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