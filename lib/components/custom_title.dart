import 'package:flutter/material.dart';
import '../constants.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 24,
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: kDefaultPadding),
              child: Text(text,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            Positioned(
                left: 0,
                bottom: 0,
                right: 0,
                child: Container(
                  margin: EdgeInsets.only(right: kDefaultPadding / 4),
                  color: kPrimaryColor.withOpacity(0.2),
                ))
          ],
        ));
  }
}
