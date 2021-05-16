import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:mobile/models/cartModel.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  // List of products in shop, static
  // var productList = <Product>[];

  // List of product in cart, dynamic
  var cartList = <CartModel>[].obs;
  // var cartList = [].obs;
  var totalPrice = 0.0.obs;

// load data first
  @override
  void onInit() {
    super.onInit();

    // GetStorage().remove('cart');
    print('==================> Controller is created');

    // List cartListSave = GetStorage().read('cart');
    List cartListSave = GetStorage().read('cart');
    // List cartListSave = a.toList();
    // // List gg = cartListSave.toList();
    // print(a);
    // print('================== save list $cartListSave');
    // print(gg);

    // print(gg[0]);
    // print(a[0]["productImage"]);
    // print(gg[0]['productTitle']);
    // print(gg[0]['productDescription']);
    // print(gg[0]['productPrice']);
    // print(gg[0]['amount']);
    // print(gg[0]['productSize']);

    if (cartListSave != null) {
      print('==============> Load data');

      cartList = cartListSave
          .map((product) => CartModel.fromJson(product))
          .toList()
          .obs;
      print(cartList.length);
    }

    ever(cartList, (_) {
      // 1. convert obs to simplw list
      // List<CartModel> todosList = cartList.toList();

      // // 2. convert an entrie list to json
      // String todosSave = jsonEncode(todosList);
      // print(todosSave);

      // // 3. save json to stroage
      // GetStorage().write('cart', todosSave);
      // // */

      GetStorage().write('cart', cartList.toList());
    });
  }

  void testA(String data) {
    print(data);
  }

  void addToCart(
      int productID,
      String productImage,
      String productTitle,
      String productDescription,
      int productPrice,
      int amount,
      String productSize) {
    print('==============> add product');

    // is cart empty ?
    if (cartList.isEmpty) {
      print('==============> Fisrt product');

      print('==========fisrtlist ${cartList.toList()}');
      cartList.add(
        CartModel(
          productID: productID,
          productImage: productImage,
          productTitle: productTitle,
          productDescription: productDescription,
          productPrice: productPrice,
          amount: amount,
          productSize: productSize,
        ),
      );
      // cartList[0].amount = 1;
      // totalPrice.value += cartList[0].productPrice;
      return;
    }

    // the product exists or not?
    int i = 0;
    for (i = 0; i < cartList.length; i++) {
      if (cartList[i].productID == productID) {
        print('==============> Next product');

        // prodect exits
        cartList[i].amount += cartList[i].amount + amount;
        totalPrice.value += cartList[i].productID;

        break;
      }
    }

    if (i == cartList.length) {
      print('==============> New product');

      // product does not exist in cart
      cartList.add(
        CartModel(
          productID: productID,
          productImage: productImage,
          productTitle: productTitle,
          productDescription: productDescription,
          productPrice: productPrice,
          amount: amount,
          productSize: productSize,
        ),
      );
      // cartList.last.amount = 1;
      totalPrice.value += cartList.last.productPrice;
    }

    // print('==============> cartList ${cartList.length}');
    print('Cart leng ${cartList.length}');
  }

  totoal() {
    var testTotal = 0.0.obs;

    for (int i = 0; i < cartList.length; i++) {
      testTotal.value += cartList[i].amount * cartList[i].productID;
      print('================== ${testTotal}');
      print(cartList[i].productID);
    }

    return testTotal;
  }
}
