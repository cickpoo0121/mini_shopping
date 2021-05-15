import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/views/components/drawer.dart';

class Favorite extends StatefulWidget {
  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  final List item = [
    {'name': 'Women Shirt', 'price': 3500},
    {'name': 'High heels', 'price': 3500},
  ];

  Future<void> refresh() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      // item.add(
      //   {'name': 'Shirt', 'price': 1400},
      // );
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
          "Favorite",
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
                      trailing: Icon(
                        Icons.favorite_rounded,
                        color: Colors.red,
                      ),
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
          onPressed: () {}),
    );
  }
}
