import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/views/components/drawer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List item = [
    {'name': 'Women Shirt', 'price': 3500},
    {'name': 'Women Shirt', 'price': 3500},
    {'name': 'Women Shirt', 'price': 3500},
    {'name': 'Women Shirt', 'price': 3500},
    {'name': 'Women Shirt', 'price': 3500},
    {'name': 'Women Shirt', 'price': 3500},
    {'name': 'Women Shirt', 'price': 3500},
    {'name': 'Women Shirt', 'price': 3500},
    {'name': 'Women Shirt', 'price': 3500},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      drawer: HamManu(),
      appBar: AppBar(
        title: Text("Home"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          )
        ],
        centerTitle: true,
        elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: [
                  FlatButton(
                    onPressed: () {},
                    child: Text("Shirt"),
                    color: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                  ),
                  SizedBox(width: 5),
                  FlatButton(
                    onPressed: () {},
                    child: Text("shoes"),
                    color: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                  ),
                  SizedBox(width: 5),
                  FlatButton(
                    onPressed: () {},
                    child: Text("Pant"),
                    color: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                  ),
                  SizedBox(width: 5),
                  FlatButton(
                    onPressed: () {},
                    child: Text("Skirt"),
                    color: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                  )
                ],
              )
            ],
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 10, 5, 0),
                      height: 190,
                      width: 170,
                      child: Card(
                        elevation: 5,
                        child: Stack(
                          children: [
                            Align(alignment: Alignment.center),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Women Shirt",
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 10, 5, 0),
                      height: 190,
                      width: 170,
                      child: Card(
                        elevation: 5,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 10, 5, 0),
                      height: 190,
                      width: 170,
                      child: Card(
                        elevation: 5,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 10, 5, 0),
                      height: 190,
                      width: 170,
                      child: Card(
                        elevation: 5,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 10, 5, 0),
                      height: 190,
                      width: 170,
                      child: Card(
                        elevation: 5,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 10, 5, 0),
                      height: 190,
                      width: 170,
                      child: Card(
                        elevation: 5,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
