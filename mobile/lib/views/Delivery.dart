import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/views/components/drawer.dart';
import 'package:http/http.dart' as http;

class Delivery extends StatefulWidget {
  @override
  _DeliveryState createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {
  var size;
  String _url = 'http://10.0.2.2:35000/order';
  String _token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjEsInVzZXJuYW1lIjoiYWRtaW4iLCJpYXQiOjE2MjExMDAxNzksImV4cCI6MTYyMTE4NjU3OX0.gDHoJeKezwqleAGyV3ilqLeypoice7gqjWOruN-oW7w';

  Future onRoad() async {
    String onRoadURL = '$_url/1';
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

  Widget createListview(data) {
    return Expanded(
      child: ListView.builder(
          itemCount: data = null ? 0 : data.length,
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
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18)),
                        height: size.height / 7,
                        width: size.width / 1.2,
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/${data[index]['']}',
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
                                  'Feel Good',
                                  style: TextStyle(color: kBtColor),
                                ), //Description
                                SizedBox(height: size.height / 100),

                                Text(
                                  '1499 Baht',
                                  style: TextStyle(fontSize: 18),
                                ), //Prince
                              ],
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        right: 10,
                        child: Text(
                          'x1',
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
                color: kBtColor, fontSize: 30, fontWeight: FontWeight.bold),
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
                        primary: kBtColor,
                        onPrimary: Colors.white,
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
                      onPressed: () {},
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
                        primary: Colors.white,
                        onPrimary: Colors.black,
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
                      onPressed: () {},
                    )
                  ],
                )
              ],
            ),
            FutureBuilder(
                future: onRoad(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      print(snapshot.data);
                      return createListview(snapshot.data);
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
