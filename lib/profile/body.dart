import 'package:flutter/material.dart';
import 'package:handi/constants.dart';
import 'package:handi/profile/password/change_password_screen.dart';
import '../components/clickable_list_item.dart';
import 'package:handi/profile/account/account_screen.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  static const textStyle = {
    "name": TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 20,
    ),
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: Image.network("https://static.diverseui.com/marvell.png",
                cacheHeight: 120, width: 120, height: 120),
          ),
          Container(
            margin: EdgeInsets.only(top: kDefaultPadding),
            child: Text(
              "Clive Duncan Jr.",
              style: textStyle["name"],
            ),
          ),
          ListView(
            shrinkWrap: true,
            children: <Widget>[
              ClickableListItem(
                  title: "Account",
                  leading: Icon(Icons.person),
                  trailing: Icon(Icons.chevron_right),
                  page: Account()),
              ClickableListItem(
                  title: "Change Password",
                  leading: Icon(Icons.security),
                  trailing: Icon(Icons.chevron_right),
                  page: ChangePassword()),
              ClickableListItem(
                  title: "Payment Method",
                  leading: Icon(Icons.account_balance),
                  trailing: Icon(Icons.chevron_right),
                  page: Account()),
              ClickableListItem(
                  title: "Notifications",
                  leading: Icon(Icons.notifications_active),
                  trailing: Icon(Icons.chevron_right),
                  page: Account()),
              ClickableListItem(
                  title: "Register as a Gig Worker",
                  leading: Icon(Icons.handyman),
                  page: Account()),
              ClickableListItem(
                  title: "Log Out",
                  margin: EdgeInsets.only(top: kDefaultPadding),
                  textStyle: TextStyle(color: Colors.red[300]),
                  leading: Icon(Icons.logout, color: Colors.red[300]),
                  page: Account()),
            ],
          )
        ],
      ),
    );
  }
}
