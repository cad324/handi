import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:handi/constants.dart';
import 'package:handi/styles/all.Style.dart';

class WorkerProfile extends StatelessWidget {
  const WorkerProfile({
    Key? key,
    required this.workerData,
    required this.title,
  }) : super(key: key);

  final Map<String, dynamic> workerData;
  final String title;

  @override
  Widget build(BuildContext context) {
    String firstName = workerData['name']!.split(" ")[0];
    String lastName = workerData['name']!.split(" ")[1];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "$firstName's Profile",
          style: black,
        ),
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: false,
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(kDefaultPadding),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(kDefaultPadding / 2),
                    child: Image.network(
                      workerData["imgUri"],
                      width: 125,
                      fit: BoxFit.cover,
                      cacheWidth: 125,
                      cacheHeight: 125,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: kDefaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 15),
                          child: Text(
                            "$firstName ${lastName.substring(0, 1)}.",
                            style: bold,
                            textScaleFactor: 1.5,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 15),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: gold,
                              ),
                              Text(
                                "${workerData["rating"]} (${workerData["reviewsTotal"]} reviews)",
                                textScaleFactor: 1.125,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.check_circle_outline),
                            Text(
                              "${workerData["jobsTotal"]} $title jobs",
                              textScaleFactor: 1.1,
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(kDefaultPadding),
              child: Row(children: <Widget>[
                Icon(Icons.handyman_outlined),
                Text(
                  " Tools: ",
                  textScaleFactor: 1.2,
                ),
                Text(
                  "I don't have special tools",
                  textScaleFactor: 1.1,
                ),
              ]),
            ),
            Divider(
              color: Colors.grey,
              indent: kDefaultPadding,
              endIndent: kDefaultPadding,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                        top: kDefaultPadding * 1, bottom: kDefaultPadding / 2),
                    child: const Text(
                      "Skills & Experience",
                      style: h3,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Text(
                    "I have skills, so many skills. I am a very skillful person who is a team player and knows Excel.",
                    textScaleFactor: 1.1,
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              margin: EdgeInsets.only(top: kDefaultPadding * 1.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("$title Reviews", style: h3),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        Text(
                          "${workerData["rating"]} (${workerData["reviewsTotal"]} reviews)",
                          textScaleFactor: 1.125,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      _ratingRow(5, 0.784, 167),
                      _ratingRow(4, 0.136, 29),
                      _ratingRow(3, 0.0515, 11),
                      _ratingRow(2, 0.0235, 5),
                      _ratingRow(1, 0.005, 1),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Stack(children: [
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [BoxShadow(color: Colors.grey)],
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: EdgeInsets.only(
                        bottom: kDefaultPadding * 1.75,
                        top: kDefaultPadding / 2,
                        left: kDefaultPadding,
                        right: kDefaultPadding,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\$${workerData['hourRate']}/hr",
                            style: h3,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: kDefaultPadding),
                              primary: Colors.green[700],
                              elevation: 0,
                              textStyle: bold,
                            ),
                            child: Text(
                              "BOOK NOW",
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }

  Container _ratingRow(int starRating, double percent, int total) {
    assert(percent <= 1, "Total must be less than 1");
    assert(percent >= 0, "Total must be at least 0");
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 5),
      child: Row(
        children: <Widget>[
          Container(
            width: 10,
            child: Text(
              "$starRating",
              textScaleFactor: 1.25,
              textAlign: TextAlign.right,
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 5),
              child: Icon(Icons.star, color: gold)),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: LinearProgressIndicator(
                  value: percent,
                  minHeight: 15,
                  backgroundColor: Colors.grey[300],
                  color: gold,
                ),
              ),
            ),
          ),
          Container(
            width: 50,
            child: Text(
              "($total)",
              textAlign: TextAlign.left,
            ),
          )
        ],
      ),
    );
  }
}
