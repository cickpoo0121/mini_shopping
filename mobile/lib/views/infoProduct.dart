import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile/constants.dart';
import 'package:http/http.dart' as http;

class InfoProduct extends StatefulWidget {
  @override
  _InfoProductState createState() => _InfoProductState();
}

var image;
var title;
var descript;
var price = 1;
var amount = 1;
var size;
var total = 1;
var getsize = '';

class _InfoProductState extends State<InfoProduct> {
  void showinfo() async {
    final tokenall = GetStorage();
    var token = tokenall.read('token');
    var idpro = tokenall.read('idproduct');
    var _url = 'http://10.0.2.2:35000/product/detail';
    token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjEsInVzZXJuYW1lIjoiYWRtaW4iLCJpYXQiOjE2MjExMjYzNDEsImV4cCI6MTYyMTIxMjc0MX0.mWGK4WZz5i9pom0AOAyRf3StmeHvATsgpNuITJkHecI';

    http.Response response = await http.post(
      Uri.parse(_url),
      headers: {'authorization': token},
      body: {
        'ProductID': '4',
      },
    );

    var info = response.body;
    var decode = jsonDecode(info);
    print(info);
    setState(() {
      image = decode[0]['ProductImage'];
      title = decode[0]['ProductTitle'];
      descript = decode[0]['ProductDescription'];
      price = decode[0]['ProductPrice'];
      amount = decode[0]['Amount'];
      size = decode[0]['CategoryID'];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    showinfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AppBar
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: kBtColor,
          ),
          onPressed: () {
            // do something
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.favorite_outline_sharp,
              color: kBtColor,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),

      body: Column(
        children: [
          Center(

              //Product Image
              child: Image.file(image,
            width: 370,
            height: 370,
          )),

          //Information Product
          Container(
            width: 1000,
            decoration: new BoxDecoration(
                color: Colors.grey[200],
                borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(40.0),
                    topRight: const Radius.circular(40.0))),
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),

                //Name Product
                Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kBtColor,
                      fontSize: 22),
                ),
                Text(
                  descript,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kBtColor,
                      fontSize: 22),
                ),
                SizedBox(
                  height: 20,
                ),

                //Price
                Text(
                  '$price',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kTextColor,
                      fontSize: 22),
                ),
                SizedBox(
                  height: 15,
                ),

                //Amount Product
                Text(
                  "$amount Pieces left!",
                  style: TextStyle(color: kTextColor, fontSize: 22),
                ),
                SizedBox(
                  height: 20,
                ),

                //Btn Select Product
                Row(
                  children: [
                    SizedBox(
                      width: 80,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        
                        primary: Colors.white, // background
                        onPrimary: Colors.black, // foreground
                      ),
                      onPressed: () {
                        setState(() {
                          getsize = 'S';
                        });
                      },
                      // do something
                      child: Text('S'),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white, // background
                        onPrimary: Colors.black, // foreground
                      ),
                      onPressed: () { setState(() {
                          getsize = 'M';
                        });},
                      // do something
                      child: Text('M'),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: kBtColor, // background
                        onPrimary: Colors.white, // foreground
                      ),
                      onPressed: () { setState(() {
                          getsize = 'L';
                        });},
                      // do something
                      child: Text('L'),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white, // background
                        onPrimary: Colors.black, // foreground
                      ),
                      onPressed: () { setState(() {
                          getsize = 'XL';
                        });},
                      // do something
                      child: Text('XL'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),

                //Select Amount
                Row(
                  children: [
                    SizedBox(
                      width: 130,
                    ),

                    //Btn - Product
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: kBtColor, // background
                        onPrimary: Colors.white, // foreground
                      ),
                      onPressed: () {},
                      // do something
                      child: Text('-'),
                    ),
                    SizedBox(
                      width: 40,
                    ),

                    // Show output of select amount product
                    Text("$total"),

                    SizedBox(
                      width: 40,
                    ),

                    //Btn + Product
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: kBtColor, // background
                        onPrimary: Colors.white, // foreground
                      ),
                      onPressed: () {
                        setState(() {
                          if (total < amount) {
                            total++;
                          }
                        });
                      },
                      child: Text('+'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),

                //Add to cart
                Container(
                  width: 1000,
                  decoration: new BoxDecoration(
                      color: Colors.white,
                      borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(40.0),
                          topRight: const Radius.circular(40.0))),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),

                      //Btn Add to cart
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: kBtColor,
                          onPrimary: Colors.white,
                          padding: EdgeInsets.symmetric(
                              horizontal: 80, vertical: 10),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(20.0),
                          ),
                        ),
                        onPressed: () {
                          Get.toNamed('/cart');
                        },
                        // do something

                        child: Text(
                          'ADD TO CART',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
