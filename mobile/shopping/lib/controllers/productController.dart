import 'package:shopping/models/product.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  // List of products in shop, static
  var productList = <Product>[];

  // List of product in cart, dynamic
  var cartList = <Product>[].obs;
  var totalPrice = 0.0.obs;

// load data first
  @override
  void onInit() {
    super.onInit();
    print('==============> Load data');

    // if no products
    if (productList.isEmpty) {
      productList.add(Product(name: 'Shirt', price: 220));
      productList.add(Product(name: 'Shoe', price: 550));
    }
  }


  totoal() {
    var testTotal = 0.0.obs;

    for (int i = 0; i < cartList.length; i++) {
      testTotal.value += cartList[i].amount * cartList[i].price;
      print('================== ${testTotal}');
      print(cartList[i].price);
    }

    return testTotal;
  }
}
