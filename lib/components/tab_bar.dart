import 'package:flutter/material.dart';
import 'package:handi/constants.dart';

void main() {
  runApp(const GigTabBar());
}

class GigTabBar extends StatelessWidget {
  const GigTabBar({Key? key}) : super(key: key);

  static const styles = {
    "title": TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.w500,
    ),
    "subtitle": TextStyle(
      fontSize: 16,
      color: Color(0xFF808080),
    )
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              bottom: const TabBar(
                tabs: [
                  Tab(
                    text: "Scheduled",
                  ),
                  Tab(
                    text: "Completed",
                  )
                ],
              ),
              title: Container(
                margin: EdgeInsets.only(left: kDefaultPadding),
                child: const Text(
                  "Gigs",
                ),
              ),
              centerTitle: false,
            ),
            body: TabBarView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.schedule,
                      color: Colors.blueGrey[600],
                      size: 64,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: kDefaultPadding,
                      ),
                      child: Text(
                        "No current gigs scheduled",
                        style: styles["title"],
                      ),
                    ),
                    Text(
                      "Book a gig today and see it here",
                      style: styles["subtitle"],
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.checklist_rtl,
                      color: Colors.blueGrey[800],
                      size: 64,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: kDefaultPadding,
                      ),
                      child: Text(
                        "No completed gigs",
                        style: styles["title"],
                      ),
                    ),
                    Text(
                      "Book a gig today.\n Once the gig is complete you'll see it here.",
                      style: styles["subtitle"],
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
