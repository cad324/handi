import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:handi/search/search_gig_screen.dart';
import 'package:handi/styles/all.Style.dart';
import '../constants.dart';

void main() => runApp(MaterialApp(home: SearchScreen()));

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchText = TextEditingController();
  String _category = "";
  final CollectionReference<Map<String, dynamic>> _categories =
      FirebaseFirestore.instance.collection("category_keywords");

  @override
  Widget build(BuildContext context) {
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
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'Search...',
                hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                ),
                contentPadding: EdgeInsets.symmetric(
                    horizontal: kDefaultPadding, vertical: kDefaultPadding - 6),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                prefixIcon: Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: Icon(Icons.close),
                  color: Colors.grey[500],
                  onPressed: () {
                    setState(() {
                      _searchText.text = "";
                    });
                  },
                ),
              ),
              onChanged: (value) async {
                var _gigList = await _categories
                    .where("tags", arrayContains: value.toLowerCase())
                    .get()
                    .then((res) => res.docs);
                if (_gigList.isNotEmpty) {
                  _gigList.forEach((element) => {
                        setState(() {
                          _category = element.id;
                        })
                      });
                } else
                  setState(() {
                    _category = "";
                  });
                setState(() {
                  _searchText.value = TextEditingValue(
                    text: value,
                    selection: TextSelection.fromPosition(
                      TextPosition(offset: value.length),
                    ),
                  );
                });
              },
            ),
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(kDefaultPadding),
        child: Column(
          children: <Widget>[
            if (_searchText.text == "")
              new Column(
                  children: kGigAssetMap.keys
                      .map(
                        (k) => GigMap(k: k),
                      )
                      .toList())
            else if (kGigAssetMap[_category] == null)
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("No results for \"${_searchText.text}\"", style: h3),
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                        child: Text(
                          "Try one of these most-searched for gigs",
                          textScaleFactor: 1.1,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: kDefaultPadding * 1.5),
                        child: Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                                children: kGigAssetMap.keys
                                    .map(
                                      (k) => GigMap(k: k),
                                    )
                                    .toList()),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            else
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Image.asset(
                          kGigAssetMap[_category]?["asset"],
                          width: 100,
                          cacheWidth: 100,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: kDefaultPadding / 2,
                              left: kDefaultPadding / 2),
                          child: Text(
                            _category,
                            textScaleFactor: 1.1,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: kDefaultPadding * 2, bottom: kDefaultPadding),
                    child: Text(
                      "Additional Gigs",
                      style: h3,
                    ),
                  ),
                  Column(
                      children: kGigAssetMap.keys
                          .where((k) => k != _category)
                          .map(
                            (k) => InkWell(
                              onTap: () {
                                Navigator.of(context).push(_createRoute(k));
                              },
                              child: Card(
                                margin:
                                    EdgeInsets.only(bottom: kDefaultPadding),
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
                                            top: kDefaultPadding / 2,
                                            left: kDefaultPadding / 2),
                                        child: Text(k,
                                            textScaleFactor: 1.1,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                            )))
                                  ],
                                ),
                              ),
                            ),
                          )
                          .toList())
                ],
              ),
          ],
        ),
      ),
    );
  }
}

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
