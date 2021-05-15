import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/models/product.dart';
import 'package:mobile/views/components/drawer.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _urlShirt = 'http://10.0.2.2:35000/product/1';
  String _urlShose = 'http://10.0.2.2:35000/product/2';
  String _token;
  var data;
  String toggle = 'shirt';

  Icon cusIcon = Icon(Icons.search);
  Widget cusSearchBar = Text("Home",
      style: TextStyle(color: kTextColor, fontWeight: FontWeight.bold));

  Future<dynamic> getShirt() async {
    _token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjEsInVzZXJuYW1lIjoiYWRtaW4iLCJpYXQiOjE2MjEwOTI1ODgsImV4cCI6MTYyMTE3ODk4OH0.IhaYTXsiRKNOIBTagovajMOxwdrQc9-td-ADHQJMMA8';

    if (_token != null) {
      http.Response response = await http.get(Uri.parse(_urlShirt),
          headers: {HttpHeaders.authorizationHeader: _token});
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        print('Server Error');
      }
    } else {
      print("No token");
    }
  }

  Future<dynamic> getShoes() async {
    _token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjEsInVzZXJuYW1lIjoiYWRtaW4iLCJpYXQiOjE2MjEwOTI1ODgsImV4cCI6MTYyMTE3ODk4OH0.IhaYTXsiRKNOIBTagovajMOxwdrQc9-td-ADHQJMMA8';

    if (_token != null) {
      http.Response response = await http.get(Uri.parse(_urlShose),
          headers: {HttpHeaders.authorizationHeader: _token});
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        print('Server Error');
      }
    } else {
      print("No token");
    }
  }

  Widget createListview(data) {
    return Expanded(
      child: ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Card(
              child: ListTile(
                leading: Image.asset(
                  "assets/images/${data[index]["ProductImage"]}",
                  height: 80,
                  width: 80,
                ),
                title: Text(data[index]["ProductTitle"]),
                subtitle: Text("${data[index]["ProductPrice"]}"),
              ),
            ),
            onTap: () {
              Get.toNamed('/productInfo');
            },
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getShirt();
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
        title: cusSearchBar,
        actions: <Widget>[
          IconButton(
            icon: cusIcon,
            onPressed: () {
              setState(() {
                if (this.cusIcon.icon == Icons.search) {
                  this.cusIcon = Icon(Icons.cancel);
                  this.cusSearchBar = TextField(
                    textInputAction: TextInputAction.go,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "Search Product"),
                  );
                } else {
                  this.cusIcon = Icon(Icons.search);
                  this.cusSearchBar = Text("Home",
                      style: TextStyle(
                          color: kTextColor, fontWeight: FontWeight.bold));
                }
              });
            },
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
                    onPressed: () {
                      setState(() {
                        toggle = 'shirt';
                      });
                    },
                    child: Text("Shirt"),
                    color: kBtColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                  ),
                  SizedBox(width: 120),
                  FlatButton(
                    onPressed: () {
                      setState(() {
                        toggle = 'shoes';
                      });
                    },
                    child: Text(
                      "Shoes",
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
          FutureBuilder(
              future: toggle == 'shirt' ? getShirt() : getShoes(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    print(snapshot.data);
                    data = snapshot.data;
                    return createListview(data);
                    // return Text('hello');
                  } else {
                    print(snapshot.error);
                    return Text("Connection Error");
                  }
                }
                return CircularProgressIndicator();
              }),
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
