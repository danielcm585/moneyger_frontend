import 'package:flutter/material.dart';
import 'package:moneyger_frontend/models/user.dart';
import 'package:moneyger_frontend/utils/colors.dart';
import 'package:moneyger_frontend/widgets/big_text.dart';
import 'package:moneyger_frontend/widgets/button.dart';
import 'package:moneyger_frontend/widgets/small_text.dart';

class Profile extends StatefulWidget {
  final User user;

  const Profile({ Key? key,
    required this.user 
  }) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 50, left: 20, right: 20),
      child: Column(
        children: [
          BigText(text: "Profile", color: AppColor.orange, size: 20),
          SizedBox(height: 40, width: double.infinity),
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(widget.user.photo!)
              )
              // borderRadius: BorderRadius.circular(50)
            ),
          ),
          SizedBox(height: 12),
          BigText(text: widget.user.username!, size: 25, color: AppColor.teal),
          SizedBox(height: 35),
          Button(
            text: "Edit Profile", 
            onPressed: () {},
            bgColor: AppColor.white,
            textColor: AppColor.black,
          ),
          SizedBox(height: 5),
          Button(
            text: "Change Password", 
            onPressed: () {},
            bgColor: AppColor.white,
            textColor: AppColor.black,
          ),
          SizedBox(height: 5),
          Button(
            text: "Connect Google", 
            onPressed: () {},
            bgColor: AppColor.white,
            textColor: AppColor.black,
          ),
          SizedBox(height: 20),
          Button(
            text: "Logout", 
            onPressed: () {},
            bgColor: AppColor.white,
            textColor: AppColor.red,
          ),
          SizedBox(height: 5),
          Button(
            text: "Delete Account", 
            onPressed: () {},
            bgColor: AppColor.red,
            textColor: AppColor.white,
          ),
          // Button(text: text, onPressed: onPressed),
          // Button(text: text, onPressed: onPressed),
        ]
      )
    );
  }
}