import 'package:flutter/material.dart';
import 'package:handi/constants.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Change Password", style: TextStyle(color: Colors.black)),
        centerTitle: false,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
        margin: EdgeInsets.all(kDefaultPadding),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: kDefaultPadding),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(labelText: "Old Password"),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: kDefaultPadding),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(labelText: "New Password"),
              ),
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: "Confirm Password"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(top: kDefaultPadding),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: kPrimaryColor,
                        padding: EdgeInsets.symmetric(
                            vertical: kDefaultPadding / 1.5,
                            horizontal: kDefaultPadding / 2)),
                    child: Text(
                      "Change Password",
                      textScaleFactor: 1.125,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
