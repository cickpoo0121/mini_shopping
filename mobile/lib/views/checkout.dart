import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/views/components/drawer.dart';
import 'package:path/path.dart';

class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  String _chosenValue1;
  String _chosenValue2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      drawer: HamManu(),
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.view_comfortable_sharp,color: Colors.black,),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        elevation: 0,
        backgroundColor: kBackgroundColor,
        title: Center(
            child: Text(
          "Check Out",
          style: TextStyle(color: kText, fontSize: 30),
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
                  width: 140,
                  height: 50,
                  child: InputDecorator(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      contentPadding: EdgeInsets.all(10),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: _chosenValue2,
                        isDense: true,
                        isExpanded: true,
                        items: [
                          DropdownMenuItem(
                              child: Text("เลือกขนส่ง"), value: ""),
                          DropdownMenuItem(child: Text("KERRY"), value: "1"),
                          DropdownMenuItem(child: Text("FLASE"), value: "2"),
                        ],
                        onChanged: (newValue) {
                          setState(() {});
                        },
                      ),
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
                  width: 140,
                  height: 50,
                  child: InputDecorator(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      contentPadding: EdgeInsets.all(10),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: _chosenValue2,
                        isDense: true,
                        isExpanded: true,
                        items: [
                          DropdownMenuItem(child: Text("เลือกชำระ"), value: ""),
                          DropdownMenuItem(
                              child: Text("ปลายทาง"), value: "Male"),
                          DropdownMenuItem(
                              child: Text("เครดิค"), value: "Female"),
                        ],
                        onChanged: (newValue) {
                          setState(() {});
                        },
                      ),
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
                  '4497 Baht',
                  style: TextStyle(color: kText, fontSize: 20),
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
                  '29 Baht',
                  style: TextStyle(color: kText, fontSize: 20),
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
                  '4526 Baht',
                  style: TextStyle(color: kText, fontSize: 20),
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
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'กรอกคูปอง',
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
                  '199 Baht',
                  style: TextStyle(color: kText, fontSize: 20),
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
                        '4327 Baht',
                        style: TextStyle(color: kText, fontSize: 25),
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
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: kText,
                            style: BorderStyle.solid,
                            width: 1.0,
                          ),
                          color: kText,
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
                            )
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
