import 'package:flutter/material.dart';
import 'package:mobile/constants.dart';

class infoProduct extends StatefulWidget {
  @override
  _infoProductState createState() => _infoProductState();
}

class _infoProductState extends State<infoProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: k2TextColor,
          ),
          onPressed: () {
            // do something
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.favorite_outline_sharp,
              color: k2TextColor,
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
              child: Image.network(
            'https://img.ltwebstatic.com/images3_pi/2020/12/24/1608774940060cd4e59644760c0af6fa0d2a9c03a7_thumbnail_900x.webp',
            width: 370,
            height: 370,
          )),
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
                Text(
                  "WOMEN เสื้อฮู้ด down",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: k2TextColor,
                      fontSize: 22),
                ),
                Text(
                  "ไร้ตะเข็บ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: k2TextColor,
                      fontSize: 22),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "1499 Baht",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kTextColor,
                      fontSize: 22),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "4 Pieces left!",
                  style: TextStyle(color: kTextColor, fontSize: 22),
                ),
                SizedBox(
                  height: 20,
                ),
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
                      onPressed: () {},
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
                      onPressed: () {},
                      child: Text('M'),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: k2TextColor, // background
                        onPrimary: Colors.white, // foreground
                      ),
                      onPressed: () {},
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
                      onPressed: () {},
                      child: Text('XL'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 130,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: k2TextColor, // background
                        onPrimary: Colors.white, // foreground
                      ),
                      onPressed: () {},
                      child: Text('-'),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Text('1'),
                    SizedBox(
                      width: 40,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: k2TextColor, // background
                        onPrimary: Colors.white, // foreground
                      ),
                      onPressed: () {},
                      child: Text('+'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
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
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: k2TextColor,
                          onPrimary: Colors.white,
                          padding: EdgeInsets.symmetric(
                              horizontal: 80, vertical: 10),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(20.0),
                          ),
                        ),
                        onPressed: () {},
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
