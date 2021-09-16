import 'package:flutter/material.dart';
import 'body.dart';

void main() => runApp(MaterialApp(
      home: Home(),
    ));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(appBar: buildAppBar(), body: Body()));
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.blue[600],
      title: Text(
        'Fredericton, NB',
        style: TextStyle(fontWeight: FontWeight.w300),
      ),
      centerTitle: false,
      leading: IconButton(
        icon: Icon(Icons.pin_drop),
        onPressed: () {},
      ),
    );
  }
}
