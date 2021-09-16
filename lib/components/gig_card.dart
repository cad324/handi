import 'package:flutter/material.dart';
import '../constants.dart';

class GigCard extends StatelessWidget {
  const GigCard(
      {Key? key, required this.item, required this.size, required this.title})
      : super(key: key);

  final Map<String, dynamic> item;
  final Size size;
  final String title;

  @override
  Widget build(BuildContext context) {
    return new Card(
        margin: EdgeInsets.symmetric(vertical: kDefaultPadding - 10),
        child: InkWell(
            onTap: () {},
            splashColor: Colors.blue.withAlpha(30),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: kDefaultPadding / 2,
                  horizontal: kDefaultPadding / 2),
              child: SizedBox(
                  width: size.width * 0.85,
                  height: 100,
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: kDefaultPadding),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          child: Image.network(
                            item["imgUri"],
                            cacheHeight: 100,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 170,
                                child: Text(
                                  item["name"],
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text("\$${item["hourRate"]}/hr",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16)),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              Text(
                                  "${item["rating"]} (${item["reviewsTotal"]} reviews)"),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.check_circle_outline),
                              Text("${item["jobsTotal"]} $title jobs")
                            ],
                          )
                        ],
                      ),
                    ],
                  )),
            )));
  }
}
