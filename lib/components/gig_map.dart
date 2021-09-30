import 'package:flutter/material.dart';
import 'package:handi/constants.dart';
import 'package:handi/search/search_gig_screen.dart';

/// [k]   key variable representing category
class GigMap extends StatelessWidget {
  const GigMap({
    Key? key,
    required this.k,
  }) : super(key: key);

  final String k;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(_createRoute(k));
      },
      child: Card(
        margin: EdgeInsets.only(bottom: kDefaultPadding),
        elevation: 0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              kGigAssetMap[k]?["asset"],
              width: 100,
              cacheWidth: 100,
            ),
            Container(
                margin: EdgeInsets.only(
                    top: kDefaultPadding / 2, left: kDefaultPadding / 2),
                child: Text(k,
                    textScaleFactor: 1.1,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    )))
          ],
        ),
      ),
    );
  }
}

Route _createRoute(label) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        Search(title: label),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
