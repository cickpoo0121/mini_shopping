import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/views/components/drawer.dart';
import 'package:http/http.dart' as http;

class MyProduct extends StatefulWidget {
  @override
  _MyProductState createState() => _MyProductState();
}

class _MyProductState extends State<MyProduct> {
  String _urlShirt = 'http://10.0.2.2:35000/product/1';
  String _urlShose = 'http://10.0.2.2:35000/product/2';
  String _token;
  var data;
  String toggle = 'shirt';

  Icon cusIcon = Icon(Icons.search);
  Widget cusSearchBar = Text("My Product",
      style: TextStyle(color: kPurpleColor, fontWeight: FontWeight.bold));

  Future<dynamic> getShirt() async {
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
                      style: TextStyle(color: kPurpleColor),
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
          ));
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _token = GetStorage().read('token');

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
        // Text(
        //   "My Product",
        //   style: TextStyle(color: kPurpleColor, fontWeight: FontWeight.bold),
        // ),
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
                    color: kPurpleColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                  ),
                  SizedBox(width: 125),
                  FlatButton(
                    onPressed: () {
                      setState(() {
                        toggle = 'shose';
                      });
                    },
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
            Icons.add,
            color: kBlueColor,
          ),
          backgroundColor: kPurpleColor,
          onPressed: () {
            Get.toNamed('/addproduct');
            // setState(() {
            //   item.add(
            //     {'name': 'Kiwi', 'price': 14, 'image': 'kiwi.png'},
            //   );
            // });
          }),
    );
  }
}
