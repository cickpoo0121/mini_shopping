import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/controllers/cartController.dart';
import 'package:mobile/views/components/drawer.dart';
import 'package:http/http.dart' as http;
import 'package:pin_code_fields/pin_code_fields.dart';

class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

const password = '111111';

class _CheckoutState extends State<Checkout> {
  final CartController _cartController = Get.find();
  int shipment = 1;
  int payment = 1;
  String _token;
  List productID;
  RxString txtpass = ''.obs;
  var shippingCost;
  var cartTotalPrice; // total price in cart
  var allPrice; // all should pay
  int discount = 0;

  var size;

  Future sellProduct(productID) async {
    String _url = 'http://10.0.2.2:35000/product/sell';

    if (_token != null) {
      http.Response response = await http.put(Uri.parse(_url),
          headers: {
            HttpHeaders.authorizationHeader: _token,
            'Content-Type': 'application/json; charset=UTF-8'
          },
          body: jsonEncode(
            {
              'ProductID': productID,
            },
          ));

      if (response.statusCode == 200) {
        print('check out success');
        // Get.offAllNamed('/cart');
      } else {
        print('Server error');
      }
    } else {
      print('no token');
    }
  }

  Future newOrder(productID) async {
    String _url = 'http://10.0.2.2:35000/order/new';

    if (_token != null) {
      http.Response response = await http.post(Uri.parse(_url),
          headers: {
            HttpHeaders.authorizationHeader: _token,
            'Content-Type': 'application/json; charset=UTF-8'
          },
          body: jsonEncode(
            {
              'ProductID': productID,
            },
          ));

      if (response.statusCode == 200) {
        print('check out success');
        // Get.offAllNamed('/cart');
      } else {
        print('Server error');
      }
    } else {
      print('no token');
    }
  }

  shipCost() {
    if (shipment == 1) {
      shippingCost = 29;
    } else {
      shippingCost = 39;
    }
  }

  @override
  void initState() {
    super.initState();
    _token = GetStorage().read('token');
    productID = Get.arguments[0];
    cartTotalPrice = Get.arguments[1];

    shipCost();

    // print(productID[0].productID);
    // print(cartTotalPrice);
    // print(productID.join(','));
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kBackgroundColor,
      drawer: HamManu(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: kBackgroundColor,
        title: Center(
            child: Text(
          "Check Out",
          style: TextStyle(color: kTextColor, fontSize: 30),
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
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  style: BorderStyle.solid,
                  width: 1.0,
                ),
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
              ),
              width: 430,
              height: 120,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 180, top: 20),
                    child: Text('ที่อยู่จัดส่ง : นายสมหมาย ชาเขียว'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 110, top: 5),
                    child: Text('(+66)845272463 714 ม.1 ต.ท่าสุด อ.อเมือง'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 280, top: 5),
                    child: Text('จ.เชียงราย 57100'),
                  ),
                ],
              ),
            ),
          ),
          //DropDown 1
          Padding(
            padding: const EdgeInsets.only(left: 90, right: 50, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Shipment',
                  style: TextStyle(fontSize: 20),
                ),
                Spacer(),
                Container(
                  width: size.width / 3.4,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<int>(
                      value: shipment,
                      isDense: true,
                      isExpanded: true,
                      items: [
                        // DropdownMenuItem(
                        //   child: Text('SHIPMENT'),
                        //   value: 1,
                        // ),
                        DropdownMenuItem(
                          child: Text('FASH'),
                          value: 1,
                        ),
                        DropdownMenuItem(
                          child: Text('KURRY'),
                          value: 2,
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          shipCost();
                          shipment = value;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          //DropDown 2
          Padding(
            padding: const EdgeInsets.only(left: 100, right: 50, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Payment',
                  style: TextStyle(fontSize: 20),
                ),
                Spacer(),
                Container(
                  width: size.width / 3.4,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<int>(
                      value: payment,
                      isDense: true,
                      isExpanded: true,
                      items: [
                        // DropdownMenuItem(
                        //   child: Text('METHOD'),
                        //   value: 1,
                        // ),
                        DropdownMenuItem(
                          child: Text('credit cards'.toUpperCase()),
                          value: 1,
                        ),
                        DropdownMenuItem(
                          child: Text('cash'.toUpperCase()),
                          value: 2,
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          payment = value;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          //DropDown 3
          Padding(
            padding: const EdgeInsets.only(left: 160, right: 50, top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'All',
                  style: TextStyle(fontSize: 20),
                ),
                Spacer(),
                Text(
                  '$cartTotalPrice Baht',
                  style: TextStyle(color: kTextColor, fontSize: 20),
                ),
              ],
            ),
          ),
          //DropDown 4
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50, top: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Shipping cost',
                  style: TextStyle(fontSize: 20),
                ),
                Spacer(),
                Text(
                  '$shippingCost Baht',
                  style: TextStyle(color: kTextColor, fontSize: 20),
                ),
              ],
            ),
          ),
          //DropDown 5
          Padding(
            padding: const EdgeInsets.only(left: 138, right: 50, top: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Total',
                  style: TextStyle(fontSize: 20),
                ),
                Spacer(),
                Text(
                  '${cartTotalPrice + shippingCost} Baht',
                  style: TextStyle(color: kTextColor, fontSize: 20),
                ),
              ],
            ),
          ),
          //DropDown 6
          Padding(
            padding: const EdgeInsets.only(left: 137, top: 20, right: 50),
            child: Row(
              children: [
                Text(
                  'Code',
                  style: TextStyle(fontSize: 20),
                ),
                Spacer(),
                Container(
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      style: BorderStyle.solid,
                      width: 1.0,
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: TextField(
                    onChanged: (value) {
                      if (value == 'freeshipment') {
                        setState(() {
                          discount = 39;
                        });
                      } else {
                        setState(() {
                          discount = 0;
                        });
                      }
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Code',
                    ),
                  ),
                ),
              ],
            ),
          ),
          //DropDown 7
          Padding(
            padding: const EdgeInsets.only(left: 100, right: 50, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Discount',
                  style: TextStyle(fontSize: 20),
                ),
                Spacer(),
                Text(
                  '$discount Baht',
                  style: TextStyle(color: kTextColor, fontSize: 20),
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            height: 130,
            width: 550,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                style: BorderStyle.solid,
                width: 1.0,
              ),
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 70, top: 25),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: Text(
                          'Total',
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                      Text(
                        '${cartTotalPrice + shippingCost - discount} Baht',
                        style: TextStyle(color: kTextColor, fontSize: 25),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Container(
                    height: 50.0,
                    width: 200,
                    child: GestureDetector(
                      onTap: () {
                        Get.defaultDialog(
                            title: 'Warning ',
                            middleText: 'Please check information',
                            confirmTextColor: Colors.white,
                            onConfirm: () {
                              Get.back();
                              Get.defaultDialog(
                                radius: 10,
                                title: 'PAYMENT PIN',
                                content: Container(
                                  padding: EdgeInsets.only(left: 20, right: 20),
                                  width: 500,
                                  height: 150,
                                  child: Center(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 30,
                                        ),
                                        PinCodeTextField(
                                          obscureText: true,
                                          appContext: context,
                                          length: 6,
                                          onChanged: (value) {
                                            if (value.length == 6) {
                                              print('complete');
                                              if (value == password) {
                                                print('password correct');
                                                sellProduct(productID);
                                                newOrder(productID);
                                                
                                                _cartController.cartList
                                                    .clear();
                                                Get.offNamed('/cart');
                                              } else {
                                                print('password not correct');
                                                txtpass.value =
                                                    'Wrong password';
                                              }
                                            }
                                          },
                                          pinTheme: PinTheme(
                                            shape: PinCodeFieldShape.box,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Obx(
                                          () => Text(
                                            txtpass.toString(),
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ),
                                        // passwordCorret != false
                                        //     ? Text('')
                                        //     : Text(
                                        //         'Wrong password',
                                        //         style: TextStyle(
                                        //             color: Colors.red),
                                        //       ),
                                      ],
                                    ),
                                  ),
                                ),
                                //   confirmTextColor: Colors.white,
                                //   onConfirm: () {},
                                //   onCancel: () => Get.back(),
                              );
                            },
                            onCancel: () => Get.back());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: kTextColor,
                            style: BorderStyle.solid,
                            width: 1.0,
                          ),
                          color: kTextColor,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Center(
                              child: Text(
                                "PAYMENT",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Montserrat',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
