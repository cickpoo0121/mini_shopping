import 'package:flutter/material.dart';
import 'package:mobile/constants.dart';

class InfoProduct extends StatefulWidget {
  @override
  _InfoProductState createState() => _InfoProductState();
}

class _InfoProductState extends State<InfoProduct> {
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
              child: Image.network(
            'https://img.ltwebstatic.com/images3_pi/2020/12/24/1608774940060cd4e59644760c0af6fa0d2a9c03a7_thumbnail_900x.webp',
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
                  "WOMEN เสื้อฮู้ด down",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kBtColor,
                      fontSize: 22),
                ),
                Text(
                  "ไร้ตะเข็บ",
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
                  "1499 Baht",
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
                  "4 Pieces left!",
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
                      onPressed: () {},
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
                      onPressed: () {},
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
                      onPressed: () {},
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
                      onPressed: () {},
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
                    Text('1'),

                    SizedBox(
                      width: 40,
                    ),


                    //Btn + Product
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: kBtColor, // background
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
                        onPressed: () {},
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
