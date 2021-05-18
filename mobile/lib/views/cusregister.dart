import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile/constants.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:mobile/views/home.dart';

class Cusregister extends StatefulWidget {
  @override
  _CusregisterState createState() => _CusregisterState();
}

class _CusregisterState extends State<Cusregister> {
  final _url = 'http://10.0.2.2:35000/mobile/register';

  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _conpassword = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phone = TextEditingController();

  void register(BuildContext context) async {
    if (_username.text == '' ||
        _password.text == '' ||
        _name.text == '' ||
        _email.text == '' ||
        _phone.text == '') {
      showAlert(context, '');
    } else if (_password.text != _conpassword.text) {
      showAlert1(context, '');
    } else {
      try {
        http.Response response = await http.post(
          Uri.parse(_url),
          body: {
            'username': _username.text,
            'password': _password.text,
            'name': _name.text,
            'email': _email.text,
            'phone': _phone.text
          },
        ).timeout(Duration(seconds: 5));

        if (response.statusCode == 200) {
          showAlert2(context, response.body.toString());
          Future.delayed(Duration(seconds: 3), () {
            Get.toNamed('/login');
          });
        } else {
          showAlert(context, response.body.toString());
        }
      } on TimeoutException catch (e) {
        print('Timeout: $e');
      } catch (e) {
        print('Error: $e');
      }
    }
  }

  void showAlert(BuildContext context, String message) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Not complete information'),
          content: Text(message),
        );
      },
    );
  }

  void showAlert1(BuildContext context, String message) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Worng Password'),
          content: Text(message),
        );
      },
    );
  }

  void showAlert2(BuildContext context, String message) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success Register'),
          content: Text(message),
        );
      },
    );
  }

  void btregister() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) => Home()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 15),
            Icon(
              Icons.supervised_user_circle_rounded,
              color: Colors.blue,
              size: 120.0,
            ),
            SizedBox(height: 5),
            RoundedTextField(
              controller: _username,
              hintText: "Username",
              icon: Icons.perm_identity_outlined,
              // color: kTextColor,

              backgroundColor: Colors.white,
              onChanged: (value) {
                print(value);
              },
            ),
            SizedBox(height: 3),
            RoundedTextField(
              controller: _password,
              hintText: "Password",
              icon: Icons.lock_open,
              backgroundColor: Colors.white,
              onChanged: (value) {
                print(value);
              },
            ),
            SizedBox(height: 3),
            RoundedTextField(
              controller: _conpassword,
              hintText: "Confirm Password",
              icon: Icons.lock_open,
              // color: kTextColor,

              backgroundColor: Colors.white,
              onChanged: (value) {
                print(value);
              },
            ),
            SizedBox(height: 3),
            RoundedTextField(
              controller: _name,
              hintText: "Fullname",
              icon: Icons.account_box_rounded,
              // color: kTextColor,

              backgroundColor: Colors.white,
              onChanged: (value) {
                print(value);
              },
            ),
            SizedBox(height: 3),
            RoundedTextField(
              controller: _email,
              hintText: "Email",
              icon: Icons.email_rounded,
              // color: kTextColor,

              backgroundColor: Colors.white,
              onChanged: (value) {
                print(value);
              },
            ),
            SizedBox(height: 3),
            RoundedTextField(
              controller: _phone,

              hintText: "Tel",
              icon: Icons.phone,
              // color: kTextColor,

              backgroundColor: Colors.white,
              onChanged: (value) {
                print(value);
              },
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
                    "Register",
                    style:
                        TextStyle(color: kPurpleColor, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () => register(context),
                ),
              ),
            ),
          ],
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
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(26),
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
