import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile/constants.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/controllers/cartController.dart';
import 'package:mobile/models/cartModel.dart';

class InfoProduct extends StatefulWidget {
  @override
  _InfoProductState createState() => _InfoProductState();
}

// CartController _cartController = CartController();

var image;
var title;
var descript;
var price = 1;
var amount = 1;
var size;
var total = 1;
var getsize = 'S';
var idpro;
var likeornot = 0.obs;

class _InfoProductState extends State<InfoProduct> {
  final CartController _cartController = Get.find();
  final tokenall = GetStorage();

  void showinfo() async {
    var token = tokenall.read('token');

    idpro = tokenall.read('idproduct');
    var _url = 'http://10.0.2.2:35000/product/detail';

    http.Response response = await http.post(
      Uri.parse(_url),
      headers: {'authorization': token},
      body: {
        'ProductID': idpro.toString(),
      },
    );

    var info = response.body;
    var decode = jsonDecode(info);

    setState(() {
      image = "http://10.0.2.2:35000/images/${decode[0]['ProductImage']}";
      title = decode[0]['ProductTitle'];
      descript = decode[0]['ProductDescription'];
      price = decode[0]['ProductPrice'];
      amount = decode[0]['Amount'];
      size = decode[0]['CategoryID'];
    });
  }

  Future<void> refresh() async {
    var token = tokenall.read('token');
    print(idpro);
    var url = 'http://10.255.60.102:35000/getfavoritebyid';
    
    http.Response response = await http.post(Uri.parse(url),
        headers: {'authorization': token,'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode(
          {
            'productid': idpro,
          },
        ));
    var info = response.body;
    var decode = jsonDecode(info);
    likeornot.value = decode;
    print(likeornot);

    // if (decode[0]['ProductID'] == idpro) {
    //   likeornot++;
    //   print(decode[0]['ProductID']);
    //   print(idpro);
    // }
  }

  void like() async {
    var token = tokenall.read('token');

    var url = 'http://10.0.2.2:35000/updatefavoriteOfUser';
    http.Response response = await http.post(Uri.parse(url),
        headers: {
          'authorization': token,
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(
          {
            'productid': idpro,
          },
        ));
  }

  @override
  void initState() {
    super.initState();
    showinfo();
    refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AppBar
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: kPurpleColor),
        actions: <Widget>[
          Obx(
            () => IconButton(
              icon: likeornot == 0
                  ? Icon(
                      Icons.favorite_outline_sharp,
                      color: kPurpleColor,
                    )
                  : Icon(
                      Icons.favorite_outlined,
                      color: Colors.red,
                    ),
              onPressed: () {
                like();
                refresh();
                // Get.toNamed('/productInfo');
              },
            ),
          ),
        ],
      ),

      body: Column(
        children: [
          Container(
            height: 350,
            child: Center(
                //Product Image
                child: Image.network(
              image,
            )),
          ),

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
                      color: kPurpleColor,
                      fontSize: 22),
                ),
                Text(
                  descript,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kPurpleColor,
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
                      color: kPurpleColor,
                      fontSize: 22),
                ),
                SizedBox(
                  height: 15,
                ),

                //Amount Product
                Text(
                  "$amount Pieces left!",
                  style: TextStyle(color: kPurpleColor, fontSize: 22),
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
                        primary: getsize == 'S'
                            ? kPurpleColor
                            : Colors.white, // background
                        onPrimary: getsize == 'S'
                            ? Colors.white
                            : Colors.black, // foreground
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
                        primary: getsize == 'M'
                            ? kPurpleColor
                            : Colors.white, // background
                        onPrimary: getsize == 'M'
                            ? Colors.white
                            : Colors.black, // foreground
                      ),
                      onPressed: () {
                        setState(() {
                          getsize = 'M';
                        });
                      },
                      // do something
                      child: Text('M'),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: getsize == 'L'
                            ? kPurpleColor
                            : Colors.white, // background
                        onPrimary: getsize == 'L'
                            ? Colors.white
                            : Colors.black, // foreground
                      ),
                      onPressed: () {
                        setState(() {
                          getsize = 'L';
                        });
                      },
                      // do something
                      child: Text('L'),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: getsize == 'XL'
                            ? kPurpleColor
                            : Colors.white, // background
                        onPrimary: getsize == 'XL'
                            ? Colors.white
                            : Colors.black, // foreground
                      ),
                      onPressed: () {
                        setState(() {
                          getsize = 'XL';
                        });
                      },
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
                        primary: kPurpleColor, // background
                        onPrimary: Colors.white, // foreground
                      ),
                      onPressed: () {
                        setState(() {
                          if (total != 0) {
                            total--;
                          }
                        });
                      },
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
                        primary: kPurpleColor, // background
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
                        height: 25,
                      ),

                      //Btn Add to cart
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: kPurpleColor,
                          onPrimary: Colors.white,
                          padding: EdgeInsets.symmetric(
                              horizontal: 80, vertical: 15),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(20.0),
                          ),
                        ),
                        onPressed: () {
                          // _cartController.testA('data');
                          // _cartController.cartList.add(CartModel(
                          //   productID: idpro,
                          //   productImage: image,
                          //   productTitle: title,
                          //   productDescription: descript,
                          //   productPrice: price,
                          //   amount: amount,
                          //   productSize: getsize,
                          // ));
                          print('========= product amount $total');
                          _cartController.addToCart(idpro, image, title,
                              descript, price, total, getsize);
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
