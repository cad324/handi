import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:handi/constants.dart';
import 'package:handi/styles/all.Style.dart';

class AddCard extends StatelessWidget {
  const AddCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Card',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
        margin: EdgeInsets.all(kDefaultPadding),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                  top: kDefaultPadding, bottom: kDefaultPadding / 2),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Cardholder's full name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: kDefaultPadding, bottom: kDefaultPadding / 2),
              child: TextField(
                obscureText: false,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(19)
                ],
                decoration: InputDecoration(
                  labelText: "Card number",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                  prefixIcon: Icon(Icons.credit_card),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: kDefaultPadding),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(right: 5),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: "MM/YY",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 5),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: "CVC",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: kDefaultPadding * 2),
              child: ElevatedButton(
                  child:
                      const Text("Add Card", textScaleFactor: 1.2, style: bold),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
