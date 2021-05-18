import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/controllers/cartController.dart';
import 'package:mobile/models/cartModel.dart';
import 'package:mobile/views/components/drawer.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _urlShirt = 'http://10.0.2.2:35000/product/1';
  String _urlShose = 'http://10.0.2.2:35000/product/2';
  var size;

  final CartController _cartController = Get.put(CartController());
  String _token;
  var data;
  String toggle = 'shirt';
  String catergory = 'category';
  // var colorList = [
  //   // Color(0xFFFBE9DE),
  //   // Color(0xFFB7CDB8),
  //   // Color(0xFFC9E4F3),
  //   // Color(0xFFF5EFBC)
  // ];

  Icon cusIcon = Icon(Icons.search);
  Widget cusSearchBar = Text("Home",
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: kBlueColor,
                        borderRadius: BorderRadius.circular(18),
                        // boxShadow: [
                        //   BoxShadow(
                        //       color: Colors.black.withOpacity(0.3),
                        //       offset: Offset(0, 1),
                        //       blurRadius: 6)
                        // ],
                      ),
                      height: size.height / 7,
                      width: size.width / 1.2,
                      child: Row(
                        children: [
                          Image.network(
                            'http://10.0.2.2:35000/images/${data[index]['ProductImage']}',
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
                                    color: kPurpleColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ), //Title
                              SizedBox(height: size.height / 200),
                              Text(
                                data[index]['ProductDescription'],
                                style: TextStyle(color: kPurpleColor),
                              ), //Description
                              SizedBox(height: size.height / 100),

                              Text(
                                '${data[index]['ProductPrice']} Baht',
                                style: TextStyle(fontSize: 18),
                              ), //Prince
                            ],
                          )
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
            onTap: () {
              GetStorage().write('idproduct', data[index]["ProductID"]);
              Get.toNamed('/productInfo');
            },
          );
          // GestureDetector(
          //   child: Card(
          //     child: ListTile(
          //       leading: Image.asset(
          //         "assets/images/${data[index]["ProductImage"]}",
          //         height: 80,
          //         width: 80,
          //       ),
          //       title: Text(data[index]["ProductTitle"]),
          //       subtitle: Text("${data[index]["ProductPrice"]}"),
          //     ),
          //   ),
          //   onTap: () {
          //     // GetStorage().write('idproduct', data[index]["ProductID"]);
          //     Get.toNamed('/productInfo');
          //   },
          // );
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
    size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: kBackgroundColor,
      drawer: HamManu(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: kBackgroundColor,
        title: cusSearchBar,
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
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary:
                          catergory == 'category' ? kPurpleColor : Colors.white,
                      onPrimary:
                          catergory == 'category' ? Colors.white : Colors.black,
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      ),
                    ),
                    child: Text(
                      'Shirt',
                      // style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      setState(() {
                        toggle = 'shirt';
                        catergory = 'category';
                      });
                    },
                  ),
                  SizedBox(width: 120),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary:
                          catergory != 'category' ? kPurpleColor : Colors.white,
                      onPrimary:
                          catergory != 'category' ? Colors.white : Colors.black,
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      ),
                    ),
                    child: Text(
                      'Shose',
                      // style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      setState(() {
                        toggle = 'shoes';
                        catergory = 'shose';
                      });
                    },
                  )
                ],
              )
            ],
          ),
          // Text(word),
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
            color: kPurpleColor,
          ),
          backgroundColor: kBlueColor,
          onPressed: () {
            Get.toNamed('/cart');
          }),
    );
  }
}
