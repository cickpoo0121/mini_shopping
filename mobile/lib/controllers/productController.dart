import 'package:get_storage/get_storage.dart';
import 'package:mobile/models/cartModel.dart';
import 'package:mobile/models/product.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  // List of products in shop, static
  // var productList = <Product>[];

  // List of product in cart, dynamic
  var cartList = <CartModel>[].obs;
  // var cartList = [].obs;
  var totalPrice = 0.0.obs;

  var newcartList = [
    {
      'ProductImage': 'hoodie.jpg',
      'ProductTitle': 'Women Shirt',
      'ProductDescription': 'Hoodie',
      'ProductPrice': 3500,
      'Amount': 1,
      'ProductID': 2
    },
    {
      'ProductImage': 'hoodie.jpg',
      'ProductTitle': 'Women Shirt',
      'ProductDescription': 'Hoodie',
      'ProductPrice': 3500,
      'Amount': 1,
      'ProductID': 3
    },
  ];

// load data first
  @override
  void onInit() {
    super.onInit();
    print('==============> Load data');

    // if no products
    // if (productList.isEmpty) {
    //   productList.add(Product(name: 'Shirt', price: 220));
    //   productList.add(Product(name: 'Shoe', price: 550));
    // }

    cartList =
        newcartList.map((product) => CartModel.fromJson(product)).toList().obs;
  }

  ever(cartList, _) {
    GetStorage().write('cart', cartList.toList());
  }

  void addToCart(int index) {
    print('==============> add product');

    // is cart empty ?
    if (cartList.isEmpty) {
      cartList.add(
        CartModel(
          productID: newcartList[index]['ProductID'],
          productImage: newcartList[index]['productImage'],
          productTitle: newcartList[index]['ProductTitle'],
          productDescription: newcartList[index]['ProductDescription'],
          productPrice: newcartList[index]['ProductPrice'],
          amount: newcartList[index]['Amount'],
        ),
      );
      cartList[0].amount = 1;
      totalPrice.value += cartList[0].productPrice;
      return;
    }

    // the product exists or not?
    int i = 0;
    for (i = 0; i < cartList.length; i++) {
      if (cartList[i].productID == newcartList[index]['ProductPrice']) {
        // prodect exits
        cartList[i].amount++;
        totalPrice.value += cartList[i].productID;

        break;
      }
    }

    if (i == cartList.length) {
      // product does not exist in cart
      cartList.add(
        CartModel(
          productID: newcartList[index]['ProductID'],
          productImage: newcartList[index]['productImage'],
          productTitle: newcartList[index]['ProductTitle'],
          productDescription: newcartList[index]['ProductDescription'],
          productPrice: newcartList[index]['ProductPrice'],
          amount: newcartList[index]['Amount'],
        ),
      );
      cartList.last.amount = 1;
      totalPrice.value += cartList.last.productPrice;
    }

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
