import 'package:flutter/material.dart';
import '../components/tab_bar.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GigTabBar(),
    );
  }
}
