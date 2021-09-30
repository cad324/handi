import 'package:flutter/material.dart';
import 'package:handi/components/clickable_list_item.dart';
import 'package:handi/constants.dart';
import 'package:handi/profile/payment/add_card.dart';
import 'package:handi/styles/all.Style.dart';

/// Payment method screen
class PaymentMethod extends StatelessWidget {
  const PaymentMethod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Payment Method",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
        margin: EdgeInsets.only(top: kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                  left: kDefaultPadding, bottom: kDefaultPadding / 2),
              child: Text(
                "ADD PAYMENT METHOD",
                style: bold,
              ),
            ),
            ClickableListItem(
                title: 'Credit Card',
                trailing: Icon(Icons.chevron_right),
                page: AddCard())
          ],
        ),
      ),
    );
  }
}
