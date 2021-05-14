import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/views/components/drawer.dart';

class Delivery extends StatefulWidget {
  @override
  _DeliveryState createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        drawer: HamManu(),
        appBar: AppBar(
          toolbarHeight: 120,
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(
                Icons.view_comfortable_sharp,
                color: Colors.black,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          elevation: 0,
          backgroundColor: kBackgroundColor,
          title: Center(
              child: Text(
            "Delivery",
            style: TextStyle(color: Colors.blue, fontSize: 30),
          )),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ),
              onPressed: () {},
            )
          ],
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                Container(
                  height: 50.0,
                  width: 200,
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            child: Text(
                              "On Road",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Montserrat',
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  height: 50.0,
                  width: 200,
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            child: Text(
                              "Successed",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Montserrat',
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
            Container(
              //Listview
              width: 600,
              height: 850,
              child: ListView(
                children: [
                  //Card1
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 40, left: 20),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(15, 10, 5, 0),
                          height: 190,
                          width: 550,
                          child: Card(
                            elevation: 5,
                            child: Stack(
                              children: [
                                Row(
                                  children: [
                                    Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, top: 20),
                                      child: Column(
                                        children: [
                                          Image.network(
                                            'https://picsum.photos/250?image=9',
                                            scale: 2.0,
                                          )
                                        ], //รูปภาพ
                                      ),
                                    ),
                                    Spacer(
                                      flex: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 3, top: 20),
                                      child: Column(
                                        children: [
                                          Text(
                                            'Women เสือฮู้ด',
                                            style: TextStyle(
                                              fontSize: 20,
                                            ),
                                          ),
                                          Text(
                                            '1499 Baht',
                                            style: TextStyle(
                                              fontSize: 25,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Spacer(
                                      flex: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 110, right: 30),
                                      child: Column(
                                        children: [
                                          Text(
                                            'x1',
                                            style: TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ),
                                    Spacer(
                                      flex: 2,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  //Card2
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 40, left: 20),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(15, 10, 5, 0),
                          height: 190,
                          width: 550,
                          child: Card(
                            elevation: 5,
                            child: Stack(
                              children: [
                                Row(
                                  children: [
                                    Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, top: 20),
                                      child: Column(
                                        children: [
                                          Image.network(
                                            'https://picsum.photos/250?image=9',
                                            scale: 2.0,
                                          )
                                        ], //รูปภาพ
                                      ),
                                    ),
                                    Spacer(
                                      flex: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 3, top: 20),
                                      child: Column(
                                        children: [
                                          Text(
                                            'Women เสือฮู้ด',
                                            style: TextStyle(
                                              fontSize: 20,
                                            ),
                                          ),
                                          Text(
                                            '1499 Baht',
                                            style: TextStyle(
                                              fontSize: 25,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Spacer(
                                      flex: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 110, right: 30),
                                      child: Column(
                                        children: [
                                          Text(
                                            'x1',
                                            style: TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ),
                                    Spacer(
                                      flex: 2,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ), //Card3
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 40, left: 20),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(15, 10, 5, 0),
                          height: 190,
                          width: 550,
                          child: Card(
                            elevation: 5,
                            child: Stack(
                              children: [
                                Row(
                                  children: [
                                    Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, top: 20),
                                      child: Column(
                                        children: [
                                          Image.network(
                                            'https://picsum.photos/250?image=9',
                                            scale: 2.0,
                                          )
                                        ], //รูปภาพ
                                      ),
                                    ),
                                    Spacer(
                                      flex: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 3, top: 20),
                                      child: Column(
                                        children: [
                                          Text(
                                            'Women เสือฮู้ด',
                                            style: TextStyle(
                                              fontSize: 20,
                                            ),
                                          ),
                                          Text(
                                            '1499 Baht',
                                            style: TextStyle(
                                              fontSize: 25,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Spacer(
                                      flex: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 110, right: 30),
                                      child: Column(
                                        children: [
                                          Text(
                                            'x1',
                                            style: TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ),
                                    Spacer(
                                      flex: 2,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ), //Card4
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 40, left: 20),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(15, 10, 5, 0),
                          height: 190,
                          width: 550,
                          child: Card(
                            elevation: 5,
                            child: Stack(
                              children: [
                                Row(
                                  children: [
                                    Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, top: 20),
                                      child: Column(
                                        children: [
                                          Image.network(
                                            'https://picsum.photos/250?image=9',
                                            scale: 2.0,
                                          )
                                        ], //รูปภาพ
                                      ),
                                    ),
                                    Spacer(
                                      flex: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 3, top: 20),
                                      child: Column(
                                        children: [
                                          Text(
                                            'Women เสือฮู้ด',
                                            style: TextStyle(
                                              fontSize: 20,
                                            ),
                                          ),
                                          Text(
                                            '1499 Baht',
                                            style: TextStyle(
                                              fontSize: 25,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Spacer(
                                      flex: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 110, right: 30),
                                      child: Column(
                                        children: [
                                          Text(
                                            'x1',
                                            style: TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ),
                                    Spacer(
                                      flex: 2,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ), //Card5
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 40, left: 20),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(15, 10, 5, 0),
                          height: 190,
                          width: 550,
                          child: Card(
                            elevation: 5,
                            child: Stack(
                              children: [
                                Row(
                                  children: [
                                    Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, top: 20),
                                      child: Column(
                                        children: [
                                          Image.network(
                                            'https://picsum.photos/250?image=9',
                                            scale: 2.0,
                                          )
                                        ], //รูปภาพ
                                      ),
                                    ),
                                    Spacer(
                                      flex: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 3, top: 20),
                                      child: Column(
                                        children: [
                                          Text(
                                            'Women เสือฮู้ด',
                                            style: TextStyle(
                                              fontSize: 20,
                                            ),
                                          ),
                                          Text(
                                            '1499 Baht',
                                            style: TextStyle(
                                              fontSize: 25,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Spacer(
                                      flex: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 110, right: 30),
                                      child: Column(
                                        children: [
                                          Text(
                                            'x1',
                                            style: TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ),
                                    Spacer(
                                      flex: 2,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
