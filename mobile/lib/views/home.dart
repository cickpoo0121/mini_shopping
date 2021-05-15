import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
          "Home",
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
                return GestureDetector(
                  child: Card(
                    child: ListTile(
                      leading: Image.asset(
                        'assets/images/hoodie.jpg',
                        height: 80,
                        width: 80,
                      ),
                      title: Text(item[index]['name']),
                      subtitle: Text('${item[index]['price']} baht'),
                      trailing: Icon(Icons.favorite_outline),
                    ),
                  ),
                  onTap: () {
                    Get.toNamed('/productInfo');
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.shopping_cart_outlined,
            color: kBtColor,
          ),
          backgroundColor: kBlueColor,
          onPressed: () {
            Get.toNamed('/cart');
            // setState(() {
            //   item.add(
            //     {'name': 'Kiwi', 'price': 14, 'image': 'kiwi.png'},
            //   );
            // });
          }),
    );
  }
}
