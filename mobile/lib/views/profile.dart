import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/views/components/drawer.dart';
import 'package:http/http.dart' as http;

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _tell = TextEditingController();

  var name = 'pipat';
  var email = 'han';
  var tell = '0888888888';
  var edit = 0;
  var image = '';

  void showdata() async {
    final tokenall = GetStorage();
    var token = tokenall.read('token');
    var _url = 'http://10.0.2.2:35000/profile/show';

    http.Response response =
        await http.get(Uri.parse(_url), headers: {'authorization': token});

    var info = response.body;
    var decode = jsonDecode(info);
    setState(() {
      name = decode[0]['NameUser'];
      _name.text = name;
      email = decode[0]['UserEmail'];
      _email.text = email;
      tell = decode[0]['UserTel'];
      _tell.text = tell;
      image = decode[0][''];
    });
  }

  void savedata() async {
    print('00;');
    final tokenall = GetStorage();
    var token = tokenall.read('token');
    var _url = 'http://10.0.2.2:35000/profile/edit';

    http.Response response = await http.put(
      Uri.parse(_url),
      headers: {'authorization': token},
      body: {
        'NameUser': _name.text,
        'UserEmail': _email.text,
        'UserTel': _tell.text,
      },
    );

    setState(() {
      edit = 0;
      name = _name.text;
      email = _email.text;
      tell = _tell.text;
    });
  }

  @override
  void initState() {
    super.initState();
    showdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      drawer: HamManu(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: kBackgroundColor,
        title: Text(
          "Profile",
          style: TextStyle(color: kPurpleColor, fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          )
        ],
        centerTitle: true,
      ),
      body: SafeArea(
        child: edit == 1
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 55),
                    Icon(
                      Icons.supervised_user_circle_rounded,
                      color: Colors.blue,
                      size: 150.0,
                    ),
                    SizedBox(height: 5),
                    Container(
                      width: 400,
                      padding: new EdgeInsets.only(
                        top: 20,
                      ),
                      child: TextField(
                        controller: _name,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.description),
                            filled: true,
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white),
                              borderRadius: new BorderRadius.circular(25.7),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white),
                              borderRadius: new BorderRadius.circular(25.7),
                            ),
                            border: new OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(40),
                              ),
                            ),
                            hintText: name),
                      ),
                    ),
                    Container(
                      width: 400,
                      padding: new EdgeInsets.only(
                        top: 20,
                      ),
                      child: TextField(
                        controller: _email,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.description),
                            filled: true,
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white),
                              borderRadius: new BorderRadius.circular(25.7),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white),
                              borderRadius: new BorderRadius.circular(25.7),
                            ),
                            border: new OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(40),
                              ),
                            ),
                            hintText: email),
                      ),
                    ),
                    Container(
                      width: 400,
                      padding: new EdgeInsets.only(
                        top: 20,
                      ),
                      child: TextField(
                        controller: _tell,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.description),
                            filled: true,
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white),
                              borderRadius: new BorderRadius.circular(25.7),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white),
                              borderRadius: new BorderRadius.circular(25.7),
                            ),
                            border: new OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(40),
                              ),
                            ),
                            hintText: tell),
                      ),
                    ),
                    SizedBox(height: 4),
                    ButtonTheme(
                      minWidth: 300.0,
                      height: 40,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(44, 20, 44, 5),
                        child: RaisedButton(
                          elevation: 2.0,
                          hoverColor: Colors.green,
                          color: kBlueColor,
                          child: Text(
                            "Save",
                            style: TextStyle(
                                color: kPurpleColor, fontWeight: FontWeight.bold),
                          ),
                          onPressed: savedata,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 55),
                    Icon(
                      Icons.supervised_user_circle_rounded,
                      color: Colors.blue,
                      size: 150.0,
                    ),
                    SizedBox(height: 5),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.08,
                      child: Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        elevation: 5,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Icon(Icons.account_box_rounded),
                                  SizedBox(width: 4),
                                  Text(
                                    name,
                                    style: TextStyle(color: kPurpleColor),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.08,
                      child: Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        elevation: 8,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Icon(Icons.email_rounded),
                                  SizedBox(width: 4),
                                  Text(email,
                                      style: TextStyle(color: kPurpleColor))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.08,
                      child: Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        elevation: 8,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Icon(Icons.phone),
                                  SizedBox(width: 4),
                                  Text(tell,
                                      style: TextStyle(color: kPurpleColor))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 4),
                    ButtonTheme(
                      minWidth: 300.0,
                      height: 40,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(44, 20, 44, 5),
                        child: RaisedButton(
                          elevation: 2.0,
                          hoverColor: Colors.green,
                          color: kBlueColor,
                          child: Text(
                            "Edit",
                            style: TextStyle(
                                color: kPurpleColor, fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            setState(() {
                              edit = 1;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
