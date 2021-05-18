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

    if (cartListSave != null) {
      print('==============> Load data');

      cartList = cartListSave
          .map((product) => CartModel.fromJson(product))
          .toList()
          .obs;
      print(cartList.length);
    }

    ever(cartList, (_) {
      print('=========== Save Data');
      GetStorage().write('cart', cartList.toList());
    });
  }

  // decrease product amount
  decreaseProduct(int index) {
    // get the selected task
    var product = cartList[index];
    // update the task
    if (product.amount == 1) {
      return cartList.removeAt(index);
    }
    product.amount--;

    // update mumber of obs list
    cartList[index] = product;
  }

  // increase product amount
  void increaseProduct(int index) {
    // get the selected task
    var product = cartList[index];
    // update the task
    product.amount++;
    // update mumber of obs list
    cartList[index] = product;
    // todos[index].status = status;
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
        print('================= last cart $amount');

        // prodect exits
        // get the selected task
        var product = cartList[i];
        // update the task
        product.amount += amount;
        // update mumber of obs list
        cartList[i] = product;

        // cartList[i].amount += cartList[i].amount + amount;
        // totalPrice.value += cartList[i].productID;

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

  // total price
  totoal() {
    var testTotal = 0.0;

    for (int i = 0; i < cartList.length; i++) {
      testTotal += cartList[i].amount * cartList[i].productPrice;
      print('================== ${testTotal}');
      print(cartList[i].productID);
    }

    return testTotal;
  }

  // product ID in Cart
  productID() {
    List productID = [];
    for (int i = 0; i < cartList.length; i++) {
      productID.add(cartList[i].productID);
      // print('===== Product id in cart ${cartList[i].productID}}');
    }
    print('===== Product id in cart $productID');
    return productID;
  }
}
