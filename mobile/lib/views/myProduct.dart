import 'package:flutter/material.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/views/components/drawer.dart';

class MyProduct extends StatefulWidget {
  @override
  _MyProductState createState() => _MyProductState();
}

class _MyProductState extends State<MyProduct> {
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

  Future<void> refresh() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      item.add(
        {'name': 'Shirt', 'price': 1400},
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: kBackgroundColor,
      drawer: HamManu(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: kBackgroundColor,
        title: Text(
          "My Product",
          style: TextStyle(color: kTextColor, fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          )
        ],
        centerTitle: true,
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
                    color: kBtColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                  ),
                  SizedBox(width: 125),
                  FlatButton(
                    onPressed: () {},
                    child: Text(
                      "shoes",
                      style: TextStyle(color: Colors.black),
                    ),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                  ),
                ],
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: item.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Image.asset(
                      'assets/images/hoodie.jpg',
                      height: 80,
                      width: 80,
                    ),
                    title: Text(item[index]['name']),
                    subtitle: ButtonTheme(
                      minWidth: 90.0,
                      height: 30,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 100, 15),
                        child: RaisedButton(
                          elevation: 1.0,
                          hoverColor: Colors.green,
                          color: kBlueColor,
                          child: Text(
                            "Edit Product",
                            style: TextStyle(color: kBtColor),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: kBlueColor,
          ),
          backgroundColor: kBtColor,
          onPressed: () {
            setState(() {
              item.add(
                {'name': 'Kiwi', 'price': 14, 'image': 'kiwi.png'},
              );
            });
          }),
    );
  }
}
