import 'package:flutter/material.dart';
import 'package:handi/styles/all.Style.dart';
import 'package:handi/constants.dart';
import 'package:handi/components/gig_card.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

const List<Map<String, dynamic>> DUMMY_DATA = [
  {
    "name": "Chad Foster",
    "hourRate": 32,
    "rating": 4.7,
    "reviewsTotal": 213,
    "jobsTotal": 498,
    "imgUri": "https://static.diverseui.com/male-16.jpg"
  },
  {
    "name": "Yohan Fletcher",
    "hourRate": 54,
    "rating": 4.4,
    "reviewsTotal": 684,
    "jobsTotal": 1021,
    "imgUri": "https://static.diverseui.com/male-92.jpg"
  },
  {
    "name": "Giani Coates",
    "hourRate": 44,
    "rating": 5.0,
    "reviewsTotal": 4,
    "jobsTotal": 16,
    "imgUri": "https://static.diverseui.com/male-88.jpg"
  },
  {
    "name": "Chad Foster",
    "hourRate": 32,
    "rating": 4.7,
    "reviewsTotal": 213,
    "jobsTotal": 498,
    "imgUri": "https://static.diverseui.com/male-16.jpg"
  },
  {
    "name": "Yohan Fletcher",
    "hourRate": 54,
    "rating": 4.4,
    "reviewsTotal": 684,
    "jobsTotal": 1021,
    "imgUri": "https://static.diverseui.com/male-92.jpg"
  },
  {
    "name": "Giani Coates",
    "hourRate": 44,
    "rating": 5.0,
    "reviewsTotal": 4,
    "jobsTotal": 16,
    "imgUri": "https://static.diverseui.com/male-88.jpg"
  },
];

Widget getObjectWidgets(
    List<Map<String, dynamic>> data, Size size, String title) {
  return new Column(
    children: data
        .map((item) => GigCard(item: item, size: size, title: title))
        .toList(),
  );
}

Widget getSnapshotListWidget(
    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> data,
    Size size,
    String title) {
  QuerySnapshot<Map<String, dynamic>> snapshot = data.data!;
  final allData = snapshot.docs.map((doc) => doc.data()).toList();
  return new Column(
    children: allData
        .map((item) => GigCard(item: item, size: size, title: title))
        .toList(),
  );
}

class Search extends StatefulWidget {
  const Search({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  bool _initialized = false;
  bool _error = false;
  final Future<FirebaseApp> fireApp = Firebase.initializeApp();
  CollectionReference<Map<String, dynamic>> _gigs =
      FirebaseFirestore.instance.collection("gigs");

  void initializeFlutterFire() async {
    try {
      await fireApp;
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
      future: _gigs.get(),
      builder: (BuildContext context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (!_initialized) {
          return Text("Loading...");
        }
        if (snapshot.hasError || _error) {
          return Text("Oops. Something went wrong!");
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return Container(
            child: Column(
              children: <Widget>[
                AppBar(
                  title: Container(
                    margin: EdgeInsets.only(left: kDefaultPadding),
                    child: Text(widget.title),
                  ),
                  textTheme: TextTheme(
                    headline6: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  iconTheme: IconThemeData(color: Colors.black),
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(Icons.tune),
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.transparent,
                          builder: (context) => Container(
                            decoration: modalBox,
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: kDefaultPadding),
                                  child: Text("Sort By:", style: h3),
                                ),
                                Divider(
                                  thickness: 0.5,
                                  color: Colors.grey[600],
                                  height: 1,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: kDefaultPadding / 2),
                                  child: Text("Recommended",
                                      style: pScaled(1.125, true)),
                                ),
                                Divider(
                                  indent: kDefaultPadding,
                                  endIndent: kDefaultPadding,
                                  thickness: 1,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: kDefaultPadding / 2),
                                  child: Text("Price (Lowest)",
                                      style: pScaled(1.125, true)),
                                ),
                                Divider(
                                  indent: kDefaultPadding,
                                  endIndent: kDefaultPadding,
                                  thickness: 1,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: kDefaultPadding / 2),
                                  child: Text("Positive Reviews (Highest)",
                                      style: pScaled(1.125, true)),
                                ),
                                Divider(
                                  indent: kDefaultPadding,
                                  endIndent: kDefaultPadding,
                                  thickness: 1,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: kDefaultPadding / 2),
                                  child: Text("Total Reviews (Highest)",
                                      style: pScaled(1.125, true)),
                                ),
                                Divider(
                                  indent: kDefaultPadding,
                                  endIndent: kDefaultPadding,
                                  thickness: 1,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: kDefaultPadding / 2),
                                  child: Text("Completed Gigs",
                                      style: pScaled(1.125, true)),
                                ),
                                Divider(
                                  indent: kDefaultPadding,
                                  endIndent: kDefaultPadding,
                                  thickness: 1,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  ],
                  centerTitle: false,
                  backgroundColor: Colors.white,
                ),
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: kDefaultPadding, top: kDefaultPadding),
                              child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Text(
                                    "Within 7 days",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      decoration: TextDecoration.none,
                                    ),
                                  )),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: kDefaultPadding, top: kDefaultPadding),
                              child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Text(
                                    "Flexible",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      decoration: TextDecoration.none,
                                    ),
                                  )),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: kDefaultPadding, top: kDefaultPadding),
                              child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.green),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Text(
                                    "Price",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.green,
                                      fontWeight: FontWeight.w500,
                                      decoration: TextDecoration.none,
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Divider(
                          indent: kDefaultPadding,
                          endIndent: kDefaultPadding / 2,
                          thickness: 1,
                        ),
                      ),
                      Text("Sorted by: Recommended", style: p),
                      Expanded(
                        child: Divider(
                          indent: kDefaultPadding / 2,
                          endIndent: kDefaultPadding,
                          thickness: 1,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(children: [
                        getSnapshotListWidget(snapshot, size, widget.title)
                      ])),
                )
              ],
            ),
          );
        }
        return Center(
          child: SizedBox(
            height: 100,
            width: 100,
            child: CircularProgressIndicator(color: kPrimaryColor),
          ),
        );
      },
    );
  }
}
