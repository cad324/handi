import 'package:flutter/material.dart';
import '../constants.dart';

void main() => runApp(MaterialApp(home: SearchScreen()));

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _searchText = TextEditingController();
    return Scaffold(
        appBar: AppBar(
      backgroundColor: Colors.white,
      elevation: 0.1,
      iconTheme: IconThemeData(color: Colors.black),
      title: PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius:
                  BorderRadius.all(Radius.circular(kDefaultPadding / 2))),
          child: TextField(
            controller: _searchText,
            decoration: InputDecoration(
              hintText: 'Search...',
              hintStyle: TextStyle(
                color: Colors.black.withOpacity(0.5),
              ),
              contentPadding: EdgeInsets.symmetric(
                  horizontal: kDefaultPadding, vertical: kDefaultPadding - 6),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              suffixIcon: IconButton(
                icon: Icon(Icons.close),
                color: Colors.grey[500],
                onPressed: () {
                  _searchText.text = "";
                },
              ),
            ),
            onChanged: (value) {
              _searchText.value = TextEditingValue(
                text: value,
                selection: TextSelection.fromPosition(
                  TextPosition(offset: value.length),
                ),
              );
            },
          ),
        ),
      ),
    ));
  }
}
