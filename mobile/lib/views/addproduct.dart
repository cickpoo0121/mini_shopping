import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/views/components/drawer.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class Addproduct extends StatefulWidget {
  @override
  _AddproductState createState() => _AddproductState();
}

TextEditingController title = TextEditingController();
TextEditingController descripttion = TextEditingController();
TextEditingController price = TextEditingController();
TextEditingController amount = TextEditingController();
String dropdownValue = 'Snicker';
TextEditingController size = TextEditingController();
var catagory = '1';
final tokenall = GetStorage();
String token;

class _AddproductState extends State<Addproduct> {
  void addproduct() async {
    if (dropdownValue == 'Snicker') {
      catagory = '1';
    } else {
      catagory = '2';
    }
    // token =
    //     'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjEsInVzZXJuYW1lIjoiYWRtaW4iLCJpYXQiOjE2MjExNTc5OTMsImV4cCI6MTYyMTI0NDM5M30.67BTXXPKZWxWcMr65EiCZ3qyY_cIePVS4t_ScOFsZ5I';

    // String token = await storage.read(key: 'token');
    var url = 'http://10.255.60.102:35000/product/new';

    var filename = _image.path;
    http.MultipartRequest request = http.MultipartRequest(
      'POST',
      Uri.parse(url),
    );

    request.files.add(await http.MultipartFile.fromPath('picture', filename));

    request.fields.addAll({
      'ProductTitle': title.text,
      'ProductDescription': descripttion.text,
      'ProductPrice': price.text,
      'Amount': amount.text,
      'ProductSize': size.text,
      'CategoryID': catagory,
    });
    var res = await request.send();
  }

  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  void initState() {
    super.initState();

    token = GetStorage().read('token');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      drawer: HamManu(),
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Addproduct",
          style: TextStyle(color: kPurpleColor, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: getImage,
                    child: _image == null
                        ? Container(
                            alignment: Alignment.center,
                            height: MediaQuery.of(context).size.height * .35,
                            color: Colors.white,
                            child: Icon(
                              Icons.add_a_photo,
                              size: 50,
                            ),
                          )
                        : Image.file(
                            _image,
                            height: MediaQuery.of(context).size.height / 2,
                          ),
                  ),
                  // new Container(
                  //   height: MediaQuery.of(context).size.height * .55,
                  //   color: kPrimaryColor,
                  // )
                ],
              ),
              new Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                padding: new EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .30,
                ),
                height: MediaQuery.of(context).size.height * .89,
                child: new Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40)),
                    color: Colors.white,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                          topLeft: Radius.circular(40)),
                      color: kBackgroundColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 400,
                          padding: new EdgeInsets.only(
                            top: 20,
                          ),
                          child: TextField(
                            controller: title,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.text_fields,
                                    color: Colors.black),
                                filled: true,
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      new BorderSide(color: Colors.white),
                                  borderRadius: new BorderRadius.circular(25.7),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      new BorderSide(color: Colors.white),
                                  borderRadius: new BorderRadius.circular(25.7),
                                ),
                                border: new OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(40),
                                  ),
                                ),
                                hintText: 'Title',
                                hintStyle: TextStyle(color: kPurpleColor)),
                          ),
                        ),
                        Container(
                          width: 400,
                          padding: new EdgeInsets.only(
                            top: 20,
                          ),
                          child: TextField(
                            controller: descripttion,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.description,
                                    color: Colors.black),
                                filled: true,
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      new BorderSide(color: Colors.white),
                                  borderRadius: new BorderRadius.circular(25.7),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      new BorderSide(color: Colors.white),
                                  borderRadius: new BorderRadius.circular(25.7),
                                ),
                                border: new OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(40),
                                  ),
                                ),
                                hintText: 'Discription',
                                hintStyle: TextStyle(color: kPurpleColor)),
                          ),
                        ),
                        Container(
                          width: 400,
                          padding: new EdgeInsets.only(
                            top: 20,
                          ),
                          child: TextField(
                            controller: price,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.attach_money,
                                    color: Colors.black),
                                filled: true,
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      new BorderSide(color: Colors.white),
                                  borderRadius: new BorderRadius.circular(25.7),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      new BorderSide(color: Colors.white),
                                  borderRadius: new BorderRadius.circular(25.7),
                                ),
                                border: new OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(40),
                                  ),
                                ),
                                hintText: 'Price',
                                hintStyle: TextStyle(color: kPurpleColor)),
                          ),
                        ),
                        Container(
                          width: 400,
                          padding: new EdgeInsets.only(
                            top: 20,
                            bottom: 20,
                          ),
                          child: TextField(
                            controller: amount,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.equalizer_rounded,
                                    color: Colors.black),
                                filled: true,
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      new BorderSide(color: Colors.white),
                                  borderRadius: new BorderRadius.circular(25.7),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      new BorderSide(color: Colors.white),
                                  borderRadius: new BorderRadius.circular(25.7),
                                ),
                                border: new OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(40),
                                  ),
                                ),
                                hintText: 'Amount',
                                hintStyle: TextStyle(color: kPurpleColor)),
                          ),
                        ),
                        Container(
                            width: 400,
                            height: 50,
                            padding: new EdgeInsets.only(
                              right: 50,
                              left: 50,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white,
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                value: dropdownValue,
                                icon: const Icon(Icons.arrow_drop_down_rounded,
                                    color: Colors.black),
                                iconSize: 24,
                                elevation: 10,
                                style: const TextStyle(color: kPurpleColor),
                                onChanged: (String newValue) {
                                  setState(() {
                                    dropdownValue = newValue;
                                  });
                                },
                                items: <String>[
                                  'Snicker',
                                  'Shirt',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Row(
                                      children: [Text(value)],
                                    ),
                                  );
                                }).toList(),
                              ),
                            )),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              padding: new EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height / 23),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(40),
                                      topLeft: Radius.circular(40)),
                                  color: Colors.white,
                                ),
                                child: Container(
                                  padding: new EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height /
                                          70,
                                      right: MediaQuery.of(context).size.width /
                                          10,
                                      left: MediaQuery.of(context).size.width /
                                          10,
                                      bottom:
                                          MediaQuery.of(context).size.height /
                                              80),
                                  child: TextButton(
                                    child: Text(
                                      "Add",
                                      style: TextStyle(color: kPurpleColor),
                                    ),
                                    onPressed: addproduct,
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                        ),
                                      ),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              kBlueColor),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
