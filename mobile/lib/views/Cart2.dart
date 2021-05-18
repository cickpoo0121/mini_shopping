import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/controllers/cartController.dart';
import 'package:mobile/views/components/drawer.dart';

class Cart2 extends StatefulWidget {
  @override
  _Cart2State createState() => _Cart2State();
}

class _Cart2State extends State<Cart2> {
  final CartController _cartController = Get.find();

  var size;

  @override
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: kBackgroundColor,
        drawer: HamManu(),
        appBar: AppBar(
          // toolbarHeight: 120,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: kBackgroundColor,
          title: Center(
              child: Text(
            "Cart",
            style: TextStyle(color: kBtColor, fontSize: 30),
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
        body: Obx(
          () => Column(
            children: [
              Expanded(
                flex: 6,
                child: _cartController.cartList.isEmpty
                    ? Center(child: Text('No item'))
                    : ListView.builder(
                        itemCount: _cartController.cartList == null
                            ? 0
                            : _cartController.cartList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(18)),
                                      height: size.height / 7,
                                      width: size.width / 1.2,
                                      child: Row(
                                        children: [
                                          Image.network(
                                            _cartController
                                                .cartList[index].productImage,
                                            height: size.height / 8,
                                            width: size.width / 4,
                                          ),
                                          SizedBox(
                                            width: size.height / 15,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                _cartController.cartList[index]
                                                    .productTitle,
                                                style: TextStyle(
                                                    color: kBtColor,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ), //Title
                                              SizedBox(
                                                  height: size.height / 200),
                                              Text(
                                                _cartController.cartList[index]
                                                    .productDescription,
                                                style:
                                                    TextStyle(color: kBtColor),
                                              ), //Description
                                              SizedBox(
                                                  height: size.height / 100),

                                              Text(
                                                '${_cartController.cartList[index].productPrice} Baht',
                                                style: TextStyle(fontSize: 18),
                                              ), //Prince
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      right: 10,
                                      top: 10,
                                      child: Column(
                                        children: [
                                          GestureDetector(
                                            child: Container(
                                              padding: EdgeInsets.all(5),
                                              // height: size.height / 15,
                                              // width: size.width / 10,
                                              decoration: BoxDecoration(
                                                color: Color.fromRGBO(
                                                    251, 233, 222, 1),
                                                shape: BoxShape.circle,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.2),
                                                    spreadRadius: 2,
                                                    blurRadius: 4,
                                                    offset: Offset(0, 1),
                                                  )
                                                ],
                                              ),
                                              child: Icon(Icons.remove),
                                            ),
                                            onTap: () {
                                              // print(index);
                                              _cartController
                                                  .decreaseProduct(index);
                                            },
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5),
                                            child: Text(
                                              '${_cartController.cartList[index].amount}',
                                            ),
                                          ),
                                          GestureDetector(
                                            child: Container(
                                              padding: EdgeInsets.all(5),
                                              // height: size.height / 15,
                                              // width: size.width / 10,
                                              decoration: BoxDecoration(
                                                color: Color.fromRGBO(
                                                    201, 228, 243, 1),
                                                shape: BoxShape.circle,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.2),
                                                    spreadRadius: 2,
                                                    blurRadius: 4,
                                                    offset: Offset(0, 1),
                                                  )
                                                ],
                                              ),
                                              child: Icon(Icons.add),
                                            ),
                                            onTap: () {
                                              // print(index);
                                              _cartController
                                                  .increaseProduct(index);
                                            },
                                          ),
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
                            onTap: () {},
                          );
                        },
                      ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'ToTal :',
                      style: TextStyle(
                          color: Color.fromRGBO(150, 148, 148, 1),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: size.width / 10,
                    ),
                    Text(
                      '${_cartController.totoal()} Baht',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: 1000,
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(40.0),
                        topRight: const Radius.circular(40.0)),
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.grey.withOpacity(0.2),
                    //     offset: Offset(0, 1),
                    //     spreadRadius: 2,
                    //     blurRadius: 4,
                    //   )
                    // ],
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 25,
                      ),

                      //Btn Add to cart
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: kBtColor,
                          onPrimary: Colors.white,
                          padding: EdgeInsets.symmetric(
                              horizontal: 80, vertical: 15),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(20.0),
                          ),
                        ),
                        onPressed: _cartController.cartList.isEmpty
                            ? null
                            : () {
                                // TODO: make alert dialog box to tell user
                                List productID = _cartController.cartList;
                                var totalPrice = _cartController.totoal();
                                Get.toNamed('/checkout',
                                    arguments: [productID, totalPrice]);
                              },
                        // do something

                        child: Text(
                          'CHECK OUT',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
