import 'package:flutter/material.dart';
import 'package:handi/constants.dart';
import 'body.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Container(
              margin: EdgeInsets.only(left: kDefaultPadding),
              child: Text("Profile"),
            ),
            centerTitle: false,
          ),
          Container(
            margin: EdgeInsets.only(top: kDefaultPadding * 3),
            child: Body(),
          ),
        ],
      ),
    );
  }
}
