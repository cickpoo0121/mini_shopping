import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/views/components/drawer.dart';
import 'package:http/http.dart' as http;

class Delivery extends StatefulWidget {
  @override
  _DeliveryState createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {
  var size;
  var data;
  String catergory = 'onRoad';
  String _url = 'http://10.0.2.2:35000/order';
  String _token;

  Future roadData() async {
    String onRoadURL;
    if (catergory == 'onRoad') {
      onRoadURL = '$_url/0';
    } else {
      onRoadURL = '$_url/1';
    }
    if (_token != null) {
      http.Response response = await http.get(Uri.parse(onRoadURL),
          headers: {HttpHeaders.authorizationHeader: _token});
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        print('Server Error');
      }
    }
    print('No token');
  }

  Future accept(orderID) async {
    print('orderID ======== $orderID');
    String accpetURL = '$_url/1';
    Get.defaultDialog(
        title: 'Accept the product',
        middleText: 'Do you want to accept ?',
        confirmTextColor: Colors.white,
        onConfirm: () async {
          if (_token != null) {
            http.Response response = await http.put(Uri.parse(accpetURL),
                headers: {
                  HttpHeaders.authorizationHeader: _token,
                  'Content-Type': 'application/json; charset=UTF-8'
                },
                body: jsonEncode(
                  {
                    'OrderID': orderID,
                  },
                ));

            if (response.statusCode == 200) {
              Get.back();
              Get.snackbar('Accept', 'one product',
                  duration: Duration(seconds: 1));
              setState(() {});
            } else {
              print('Server error');
            }
          } else {
            print('no token');
          }
        },
        onCancel: () => Get.back());
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
                            color: kBabyBlueColor,
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
                      catergory != 'onRoad'
                          ? SizedBox()
                          : Positioned(
                              bottom: 5,
                              right: 10,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.green),
                                child: Text('Accept'),
                                onPressed: () {
                                  accept(data[index]['OrderID']);
                                  print(data[index]['OrderID']);
                                },
                              )),
                      Positioned(
                        top: 5,
                        right: 10,
                        child: Text(
                          'x${data[index]['Order_amount']}',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      )
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

  @override
  void initState() {
    super.initState();
    _token = GetStorage().read('token');
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: kBackgroundColor,
        drawer: HamManu(),
        appBar: AppBar(
          // toolbarHeight: 120,
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          backgroundColor: kBackgroundColor,
          title: Center(
              child: Text(
            "Delivery",
            style: TextStyle(
                color: kPurpleColor, fontSize: 30, fontWeight: FontWeight.bold),
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
                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary:
                            catergory == 'onRoad' ? kPurpleColor : Colors.white,
                        onPrimary:
                            catergory == 'onRoad' ? Colors.white : Colors.black,
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(20.0),
                        ),
                      ),
                      child: Text(
                        'On Road',
                        // style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        setState(() {
                          catergory = 'onRoad';
                        });
                      },
                    )
                  ],
                ),
                SizedBox(
                  width: size.width / 7,
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary:
                            catergory != 'onRoad' ? kPurpleColor : Colors.white,
                        onPrimary:
                            catergory != 'onRoad' ? Colors.white : Colors.black,
                        padding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(20.0),
                        ),
                      ),
                      child: Text(
                        'Successed',
                        // style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        setState(() {
                          catergory = 'success';
                        });
                      },
                    )
                  ],
                )
              ],
            ),
            FutureBuilder(
                future: roadData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      data = snapshot.data;
                      print(snapshot.data);
                      return data.length == 0
                          ? Container(
                              padding: EdgeInsets.only(top: size.height / 10),
                              child: Text('No item'))
                          : createListview(data);
                    } else {
                      print(snapshot.error);
                      return Text('Connection error, try again');
                    }
                  }
                  return CircularProgressIndicator();
                })
          ],
        ));
  }
}
