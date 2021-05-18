import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile/constants.dart';
import 'package:http/http.dart' as http;

class HamManu extends StatefulWidget {
  @override
  _HamManuState createState() => _HamManuState();
}

class _HamManuState extends State<HamManu> {
  String _token;
  String _url = 'http://10.0.2.2:35000/mobile/verify';
  var userInfo;
  var info = [];

  Future getUserInfo() async {
    if (_token != null) {
      http.Response response = await http.get(Uri.parse(_url),
          headers: {HttpHeaders.authorizationHeader: _token});
      if (response.statusCode == 200) {
        setState(() {
          userInfo = json.decode(response.body);
          info.add(userInfo);
        });
        print(info[0]);
      } else {
        print('Server Error');
      }
    } else {
      print("No token");
    }
  }

  @override
  void initState() {
    super.initState();
    _token = GetStorage().read('token');
    getUserInfo();

    // print(_token);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: kPurpleColor,
        child: ListView(
          padding: const EdgeInsets.all(0.0),
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: kPurpleColor),
              arrowColor: kPurpleColor,
              accountName: Text(info[0]['username']),
              accountEmail: Text(info[0]['userEmail']),
              currentAccountPicture: CircleAvatar(
                child: Text(
                  info[0]['username'][0].toUpperCase(),
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                backgroundColor: kBlueColor,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ListTile(
              title: Text(
                'Home',
                style: TextStyle(color: Colors.white),
              ),
              leading: Icon(
                Icons.house_rounded,
                color: Colors.white,
              ),
              onTap: () {
                Get.back();
                Get.toNamed('/home');
              },
            ),
            ListTile(
              title: Text(
                'Delivery',
                style: TextStyle(color: Colors.white),
              ),
              leading: Icon(
                Icons.local_shipping_rounded,
                color: Colors.white,
              ),
              onTap: () {
                Get.back();
                Get.toNamed('/delivery');
              },
            ),
            ListTile(
              title: Text(
                'My Product',
                style: TextStyle(color: Colors.white),
              ),
              leading: Icon(
                Icons.shopping_cart_rounded,
                color: Colors.white,
              ),
              onTap: () {
                Get.back();
                Get.toNamed('/myproduct');
              },
            ),
            ListTile(
              title: Text(
                'My Favorite',
                style: TextStyle(color: Colors.white),
              ),
              leading: Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              onTap: () {
                Get.back();
                Get.toNamed('/favorite');
              },
            ),
            ListTile(
              title: Text(
                'Profile',
                style: TextStyle(color: Colors.white),
              ),
              leading: Icon(
                Icons.perm_identity_outlined,
                color: Colors.white,
              ),
              onTap: () {
                Get.back();
                Get.toNamed('/Profile');
              },
            ),
            // Spacer(),
            ListTile(
              title: Text(
                'Log out',
                style: TextStyle(color: Colors.white),
              ),
              leading: Icon(
                Icons.logout,
                color: Colors.white,
              ),
              onTap: () {
                Get.back();
                Get.toNamed('/login');
              },
            )
          ],
        ),
      ),
    );
  }
}
