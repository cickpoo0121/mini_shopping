import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/views/components/drawer.dart';
import 'package:path/path.dart';

class Addproduct extends StatefulWidget {
  @override
  _AddproductState createState() => _AddproductState();
}

var _catagorie = 'Size S,M,L,XL';

class _AddproductState extends State<Addproduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      drawer: HamManu(),
      appBar: AppBar(
        title: Text("Addproduct"),
        centerTitle: true,
        elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height * .35,
                    color: Colors.blue,
                    child: Icon(
                      Icons.add_a_photo,
                      size: 50,
                    ),
                  ),
                  new Container(
                    height: MediaQuery.of(context).size.height * .55,
                    color: kPrimaryColor,
                  )
                ],
              ),
              new Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                padding: new EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .30,
                ),
                height: MediaQuery.of(context).size.height * .90,
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
                      color: Colors.black26,
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: 400,
                          padding: new EdgeInsets.only(
                            top: 20,
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.text_fields),
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
                                hintText: 'Title'),
                          ),
                        ),
                        Container(
                          width: 400,
                          padding: new EdgeInsets.only(
                            top: 20,
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.description),
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
                                hintText: 'Discription'),
                          ),
                        ),
                        Container(
                          width: 400,
                          padding: new EdgeInsets.only(
                            top: 20,
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.attach_money),
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
                                hintText: 'Price'),
                          ),
                        ),
                        Container(
                          width: 400,
                          padding: new EdgeInsets.only(
                            top: 20,
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.equalizer_rounded),
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
                                hintText: 'Amount'),
                          ),
                        ),
                        Container(
                          width: 400,
                          padding: new EdgeInsets.only(
                            top: 20,
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.format_list_bulleted),
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
                                hintText: 'Catagories'),
                          ),
                        ),
                        Container(
                          width: 400,
                          padding: new EdgeInsets.only(
                            top: 20,
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                                prefixIcon:
                                    Icon(Icons.format_list_numbered_rounded),
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
                                hintText: _catagorie),
                          ),
                        ),
                        Container(
                          padding: new EdgeInsets.only(top: 30),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 74,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(40),
                                  topLeft: Radius.circular(40)),
                              color: Colors.white,
                            ),
                            child: Container(
                              padding: new EdgeInsets.only(
                                  top: 15, right: 50, left: 50, bottom: 15),
                              child: TextButton(
                                child: Text(
                                  "Add",
                                  style: TextStyle(color: Colors.purple[600]),
                                ),
                                onPressed: () {},
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                    ),
                                  ),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.blueAccent),
                                ),
                              ),
                            ),
                          ),
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
