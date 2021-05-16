import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile/favorite.dart';
import 'package:mobile/views/Cart2.dart';
import 'package:mobile/views/Delivery.dart';
import 'package:mobile/views/addproduct.dart';
import 'package:mobile/views/checkout.dart';
import 'package:mobile/views/cusregister.dart';
import 'package:mobile/views/home.dart';
import 'package:mobile/views/infoProduct.dart';
import 'package:mobile/views/login.dart';
import 'package:mobile/views/myProduct.dart';
import 'package:mobile/views/profile.dart';

void main() async {
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      initialRoute: '/login',
      getPages: [
        GetPage(name: '/login', page: () => Login()),
        GetPage(name: '/home', page: () => Home()),
        GetPage(name: '/register', page: () => Cusregister()),
        GetPage(name: '/productInfo', page: () => InfoProduct()),
        GetPage(name: '/cart', page: () => Cart2()),
        GetPage(name: '/checkout', page: () => Checkout()),
        GetPage(name: '/delivery', page: () => Delivery()),
        GetPage(name: '/Profile', page: () => Profile()),
        GetPage(name: '/myproduct', page: () => MyProduct()),
        GetPage(name: '/addproduct', page: () => Addproduct()),
        GetPage(name: '/favorite', page: () => Favorite()),
      ],
    ),
  );
}
