import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0.0),
          children: <Widget>[
            UserAccountsDrawerHeader(
                accountName: Text("Shopping mall"),
                accountEmail: Text("Shop Owner"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.red,
                )),
            ListTile(title: Text('Home'), leading: Icon(Icons.house_rounded)),
            ListTile(
              title: Text('Delivery'),
              leading: Icon(Icons.local_shipping_rounded),
            ),
            ListTile(
              title: Text('My Product'),
              leading: Icon(Icons.shopping_cart_rounded),
              onTap: () => Navigator.of(context).pop(),
            ),
            ListTile(
              title: Text('Profile'),
              leading: Icon(
                Icons.perm_identity_outlined,
              ),
              onTap: () => Navigator.of(context).pop(),
            )
          ],
        ),
      ),
    );
  }
}
