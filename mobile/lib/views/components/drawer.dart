import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HamManu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0.0),
        children: <Widget>[
          UserAccountsDrawerHeader(
              accountName: Text("Shopping mall"),
              accountEmail: Text("Shop Owner"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.red,
              )),
          ListTile(
            title: Text('Home'),
            leading: Icon(Icons.house_rounded),
            onTap: () {
              Get.back();
              Get.toNamed('/home');
            },
          ),
          ListTile(
            title: Text('Delivery'),
            leading: Icon(Icons.local_shipping_rounded),
            onTap: () {
              Get.back();
              Get.toNamed('/delivery');
            },
          ),
          ListTile(
            title: Text('My Product'),
            leading: Icon(Icons.shopping_cart_rounded),
            onTap: () {
              Get.back();
              Get.toNamed('/myproduct');
            },
          ),
          ListTile(
            title: Text('My Order'),
            leading: Icon(Icons.shopping_cart_rounded),
            onTap: () {},
          ),
          ListTile(
            title: Text('My Favorite'),
            leading: Icon(Icons.favorite),
            onTap: () {},
          ),
          ListTile(
            title: Text('Profile'),
            leading: Icon(
              Icons.perm_identity_outlined,
            ),
            onTap: () {
              Get.back();
              Get.toNamed('/Profile');
            },
          ),
          ListTile(
            title: Text('Log out'),
            leading: Icon(Icons.logout),
            onTap: () {
              Get.back();
              Get.toNamed('/login');
            },
          )
        ],
      ),
    );
  }
}
