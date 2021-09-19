import 'package:flutter/material.dart';
import 'package:handi/constants.dart';
import 'package:handi/styles/all.Style.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Account",
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: false,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
              margin: EdgeInsets.only(top: kDefaultPadding),
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text("Profile Photo"),
                    trailing: Icon(Icons.person),
                  ),
                  Divider(
                    endIndent: kDefaultPadding / 2,
                    indent: kDefaultPadding / 2,
                  ),
                  ListTile(
                    title: Text("First Name"),
                    trailing: Text("Clive", style: pScaled(1, false)),
                  ),
                  Divider(
                    endIndent: kDefaultPadding / 2,
                    indent: kDefaultPadding / 2,
                  ),
                  ListTile(
                    title: Text("Last Name"),
                    trailing: Text("Duncan Jr.", style: pScaled(1, false)),
                  ),
                  Divider(
                    endIndent: kDefaultPadding / 2,
                    indent: kDefaultPadding / 2,
                  ),
                  ListTile(
                    title: Text("Email"),
                    trailing:
                        Text("cliveduncan@handi.com", style: pScaled(1, false)),
                  ),
                  Divider(
                    endIndent: kDefaultPadding / 2,
                    indent: kDefaultPadding / 2,
                  ),
                  ListTile(
                    title: Text("Phone Number"),
                    trailing: Text("(506) 555-2021", style: pScaled(1, false)),
                  ),
                  Divider(
                    endIndent: kDefaultPadding / 2,
                    indent: kDefaultPadding / 2,
                  ),
                  ListTile(
                    title: Text("Postal Code"),
                    trailing: Text("E3B 5V8", style: pScaled(1, false)),
                  ),
                  Divider(
                    endIndent: kDefaultPadding / 2,
                    indent: kDefaultPadding / 2,
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
