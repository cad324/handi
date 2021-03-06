import 'package:flutter/material.dart';
import 'package:handi/search/search_gig_screen.dart';
import '../constants.dart';
import 'package:google_fonts/google_fonts.dart';

class GigCategory extends StatelessWidget {
  const GigCategory({
    Key? key,
    required this.size,
    required this.asset,
    required this.label,
  }) : super(key: key);

  final Size size;
  final String asset;
  final String label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            fullscreenDialog: true,
            builder: (context) => Search(
                  title: label,
                )));
      },
      child: Container(
        width: size.width * 0.4,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: kDefaultPadding),
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    asset,
                    width: 175,
                    cacheWidth: 171,
                  ),
                ),
                Row(
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          label,
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(fontWeight: FontWeight.w500),
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
