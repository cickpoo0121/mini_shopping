import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/views/components/drawer.dart';

class Cart2 extends StatefulWidget {
  @override
  _Cart2State createState() => _Cart2State();
}

class _Cart2State extends State<Cart2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        drawer: HamManu(),
      appBar: AppBar(
        toolbarHeight: 120,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.view_comfortable_sharp,color: Colors.black,),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        elevation: 0,
        backgroundColor: kBackgroundColor,
        title: Center(
            child: Text(
          "Cart",
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
            Container(
              width: 600,
              height: 785,
              child: ListView(
                children: [
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
                                          top: 15, bottom: 10),
                                      child: Column(
                                        children: [
                                          MaterialButton(
                                            onPressed: () {},
                                            color: Colors.grey[200],
                                            textColor: Colors.black,
                                            child: Icon(
                                              Icons.remove,
                                              size: 24,
                                            ),
                                            padding: EdgeInsets.all(16),
                                            shape: CircleBorder(),
                                          ),
                                          Spacer(),
                                          Text(
                                            '1',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          Spacer(),
                                          MaterialButton(
                                            onPressed: () {},
                                            color: Colors.blue,
                                            textColor: Colors.white,
                                            child: Icon(
                                              Icons.add,
                                              size: 24,
                                            ),
                                            padding: EdgeInsets.all(16),
                                            shape: CircleBorder(),
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
                                          top: 15, bottom: 10),
                                      child: Column(
                                        children: [
                                          MaterialButton(
                                            onPressed: () {},
                                            color: Colors.grey[200],
                                            textColor: Colors.black,
                                            child: Icon(
                                              Icons.remove,
                                              size: 24,
                                            ),
                                            padding: EdgeInsets.all(16),
                                            shape: CircleBorder(),
                                          ),
                                          Spacer(),
                                          Text(
                                            '1',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          Spacer(),
                                          MaterialButton(
                                            onPressed: () {},
                                            color: Colors.blue,
                                            textColor: Colors.white,
                                            child: Icon(
                                              Icons.add,
                                              size: 24,
                                            ),
                                            padding: EdgeInsets.all(16),
                                            shape: CircleBorder(),
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
                                          top: 15, bottom: 10),
                                      child: Column(
                                        children: [
                                          MaterialButton(
                                            onPressed: () {},
                                            color: Colors.grey[200],
                                            textColor: Colors.black,
                                            child: Icon(
                                              Icons.remove,
                                              size: 24,
                                            ),
                                            padding: EdgeInsets.all(16),
                                            shape: CircleBorder(),
                                          ),
                                          Spacer(),
                                          Text(
                                            '1',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          Spacer(),
                                          MaterialButton(
                                            onPressed: () {},
                                            color: Colors.blue,
                                            textColor: Colors.white,
                                            child: Icon(
                                              Icons.add,
                                              size: 24,
                                            ),
                                            padding: EdgeInsets.all(16),
                                            shape: CircleBorder(),
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
                                          top: 15, bottom: 10),
                                      child: Column(
                                        children: [
                                          MaterialButton(
                                            onPressed: () {},
                                            color: Colors.grey[200],
                                            textColor: Colors.black,
                                            child: Icon(
                                              Icons.remove,
                                              size: 24,
                                            ),
                                            padding: EdgeInsets.all(16),
                                            shape: CircleBorder(),
                                          ),
                                          Spacer(),
                                          Text(
                                            '1',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          Spacer(),
                                          MaterialButton(
                                            onPressed: () {},
                                            color: Colors.blue,
                                            textColor: Colors.white,
                                            child: Icon(
                                              Icons.add,
                                              size: 24,
                                            ),
                                            padding: EdgeInsets.all(16),
                                            shape: CircleBorder(),
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
                                          top: 15, bottom: 10),
                                      child: Column(
                                        children: [
                                          MaterialButton(
                                            onPressed: () {},
                                            color: Colors.grey[200],
                                            textColor: Colors.black,
                                            child: Icon(
                                              Icons.remove,
                                              size: 24,
                                            ),
                                            padding: EdgeInsets.all(16),
                                            shape: CircleBorder(),
                                          ),
                                          Spacer(),
                                          Text(
                                            '1',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          Spacer(),
                                          MaterialButton(
                                            onPressed: () {},
                                            color: Colors.blue,
                                            textColor: Colors.white,
                                            child: Icon(
                                              Icons.add,
                                              size: 24,
                                            ),
                                            padding: EdgeInsets.all(16),
                                            shape: CircleBorder(),
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
            Container(
              height: 135,
              width: 700,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  style: BorderStyle.solid,
                  width: 1.0,
                ),
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 70, top: 25),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Text(
                            'Total',
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                        Text(
                          '4327 Baht',
                          style: TextStyle(color: Colors.blue, fontSize: 25),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Container(
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
                                  "CHECK OUT",
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
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
