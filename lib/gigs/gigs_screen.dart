import 'package:flutter/material.dart';
import './body.dart';

void main() => runApp(MaterialApp(
      home: Gigs(),
    ));

class Gigs extends StatelessWidget {
  const Gigs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Body(),
    );
  }
}
