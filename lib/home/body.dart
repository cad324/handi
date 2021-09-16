import 'package:flutter/material.dart';
import 'package:handi/constants.dart';
import '../components/header_with_searchbar.dart';
import '../components/gig_category.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: kDefaultPadding),
      child: Column(
        children: <Widget>[
          HeaderWithSearchBar(size: size),
          Row(
            children: [
              GigCategory(
                size: size,
                label: "Babysitting",
                asset: "assets/images/gigs/babysitting.jpg",
              ),
              GigCategory(
                size: size,
                label: "Electrical Work",
                asset: "assets/images/gigs/electrician.jpg",
              ),
            ],
          ),
          Row(
            children: [
              GigCategory(
                size: size,
                label: "Plumbing",
                asset: "assets/images/gigs/plumbing.jpg",
              ),
              GigCategory(
                size: size,
                label: "Moving Assistance",
                asset: "assets/images/gigs/moving.jpg",
              ),
            ],
          ),
          Row(
            children: [
              GigCategory(
                size: size,
                label: "House Cleaning",
                asset: "assets/images/gigs/house-cleaning.jpg",
              ),
              GigCategory(
                size: size,
                label: "Yard Work",
                asset: "assets/images/gigs/yard-work.jpg",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
