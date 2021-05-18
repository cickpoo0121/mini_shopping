import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/constants.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _url = 'http://10.0.2.2:35000/mobile/login';

  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();

  void login() async {
    String username = _username.text;
    String password = _password.text;

    http.Response response = await http.post(Uri.parse(_url),
        body: {'username': username, 'password': password});
    if (_username.text == '' || _password.text == '') {
      showAlert1('');
    } else {
      if (response.statusCode == 200) {
        String token = response.body.toString();
        GetStorage().write('token', token);
        Get.offAllNamed('/home');
      } else {
        Get.defaultDialog(title: 'Error', middleText: response.body.toString());
        print(response.body.toString());
      }
    }
  }

  void showAlert1(String message) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Username or password not entered.'),
          content: Text(message),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.supervised_user_circle_rounded,
                color: Colors.blue,
                size: 150.0,
              ),
              SizedBox(height: 20),
              TextField(
                  onChanged: (value) {
                  print(value);
                },
                controller: _username,
                 decoration: new InputDecoration(
                  icon: new Icon(Icons.perm_identity_outlined),
                  labelText: "Username",
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: const BorderSide(
                      color: Colors.white,
                      

                      // hintText: "Password",
                      // icon: Icons.lock_open,
                      // backgroundColor: Colors.white,
                    ),
                  ),
                ),
              //   hintText: "Username",
              //   icon: Icons.perm_identity_outlined,
              //   // color: kTextColor,

              //   backgroundColor: Colors.white,
              // ,
              ),
              SizedBox(height: 8),
              TextField(
                obscureText: true,
                onChanged: (value) {
                  print(value);
                },
                controller: _password,
                decoration: new InputDecoration(
                  icon: new Icon(Icons.lock_sharp),
                  labelText: "Password",
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: const BorderSide(
                      color: Colors.white,
                      

                      // hintText: "Password",
                      // icon: Icons.lock_open,
                      // backgroundColor: Colors.white,
                    ),
                  ),
                ),
              ),
             
              ButtonTheme(
                minWidth: 300.0,
                height: 40,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(44, 20, 44, 0),
                  child: RaisedButton(
                    elevation: 2.0,
                    color: kPurpleColor,
                    child: Text(
                      "Sign in",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () => login(),
                  ),
                ),
              ),
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
                    color: kBackgroundColor,
                    child: Text(
                      "Register",
                      style: TextStyle(
                          color: kPurpleColor, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Get.toNamed('/register');
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

class RoundedTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final Color color;
  final Color backgroundColor;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  const RoundedTextField(
      {Key key,
      this.hintText,
      this.icon,
      this.onChanged,
      this.color = Colors.white,
      this.backgroundColor = Colors.blueAccent,
      this.controller})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(36),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        cursorColor: color,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Colors.black,
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: kPurpleColor),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
