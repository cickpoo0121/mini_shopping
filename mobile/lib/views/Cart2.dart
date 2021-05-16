import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/views/components/drawer.dart';

class Cart2 extends StatefulWidget {
  @override
  _Cart2State createState() => _Cart2State();
}

class _Cart2State extends State<Cart2> {
  var size;
  List<Map<String, dynamic>> data = [
    {
      'ProductImage': 'hoodie.jpg',
      'ProductTitle': 'Women Shirt',
      'ProductDescription': 'Hoodie',
      'ProductPrice': 3500,
      'Amount': 1,
      'ProductID': 2
    },
    {
      'ProductImage': 'hoodie.jpg',
      'ProductTitle': 'Women Shirt',
      'ProductDescription': 'Hoodie',
      'ProductPrice': 3500,
      'Amount': 1,
      'ProductID': 3
    },
  ];

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      drawer: HamManu(),
      appBar: AppBar(
        // toolbarHeight: 120,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: kBackgroundColor,
        title: Center(
            child: Text(
          "Cart",
          style: TextStyle(color: kBtColor, fontSize: 30),
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
      body: ListView.builder(
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18)),
                        height: size.height / 7,
                        width: size.width / 1.2,
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/${data[index]['ProductImage']}',
                              height: size.height / 8,
                              width: size.width / 4,
                            ),
                            SizedBox(
                              width: size.height / 15,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  data[index]['ProductTitle'],
                                  style: TextStyle(
                                      color: kBtColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ), //Title
                                SizedBox(height: size.height / 200),
                                Text(
                                  data[index]['ProductDescription'],
                                  style: TextStyle(color: kBtColor),
                                ), //Description
                                SizedBox(height: size.height / 100),

                                Text(
                                  '${data[index]['ProductPrice']} Baht',
                                  style: TextStyle(fontSize: 18),
                                ), //Prince
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 10,
                        top: 10,
                        child: Column(
                          children: [
                            GestureDetector(
                              child: Container(
                                padding: EdgeInsets.all(5),
                                // height: size.height / 15,
                                // width: size.width / 10,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(251, 233, 222, 1),
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 4,
                                      offset: Offset(0, 1),
                                    )
                                  ],
                                ),
                                child: Icon(Icons.remove),
                              ),
                              onTap: () {},
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Text(
                                '${data[index]['Amount']}',
                              ),
                            ),
                            GestureDetector(
                              child: Container(
                                padding: EdgeInsets.all(5),
                                // height: size.height / 15,
                                // width: size.width / 10,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(201, 228, 243, 1),
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 4,
                                      offset: Offset(0, 1),
                                    )
                                  ],
                                ),
                                child: Icon(Icons.add),
                              ),
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height / 5.5,
                  )
                ],
              ),
              onTap: () {},
            );
          }),
    );
  }
}
