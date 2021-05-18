import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/views/components/drawer.dart';
import 'package:http/http.dart' as http;

class Favorite extends StatefulWidget {
  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  final tokenall = GetStorage();
  
  final List item = [].obs;

  Future<void> refresh() async {
    var token = tokenall.read('token');
    
    var url = 'http://10.255.60.102:35000/getfavoriteOfUser';
    // await Future.delayed(Duration(seconds: 2));
    http.Response response = await http.get(
      Uri.parse(url),
      headers: {'authorization': token},
    );
    var info = response.body;
    var decode = jsonDecode(info);
    // setState(() {
    print('hello');
    for (var prop in decode) {
      item.add(
        {
          'name': prop['ProductTitle'],
          'price': prop['ProductPrice'],
          'image': "http://10.0.2.2:35000/images/${prop['ProductImage']}",
          'id': prop['ProductID']
        },
      );
    }
    // });
  }

  void like(id) async {
    print('delete seccess');
    var token = tokenall.read('token');
    

    var url = 'http://10.0.2.2:35000/updatefavoriteOfUser';
    http.Response response = await http.post(Uri.parse(url),
        headers: {
          'authorization': token,
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(
          {
            'productid': id,
          },
        ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: kBackgroundColor,
      drawer: HamManu(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: kBackgroundColor,
        title: Text(
          "Favorite",
          style: TextStyle(color: kPurpleColor, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Obx(
        () => Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: item.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: Card(
                      child: ListTile(
                        leading: Image.network(
                          item[index]['image'],
                          height: 80,
                          width: 80,
                        ),
                        title: Text(item[index]['name']),
                        subtitle: Text('${item[index]['price']} baht'),
                        trailing: Icon(
                          Icons.favorite_rounded,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    onTap: () {
                      like(item[index]['id']);
                      item.clear();
                      refresh();
                      // Get.toNamed('/productInfo');
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.shopping_cart_outlined,
            color: kPurpleColor,
          ),
          backgroundColor: kBlueColor,
          onPressed: () {}),
    );
  }
}
