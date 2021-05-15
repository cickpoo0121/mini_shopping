import 'package:flutter/material.dart';
import 'package:mobile/constants.dart';
import 'package:get/get.dart';

class Cusregister extends StatefulWidget {
  @override
  _CusregisterState createState() => _CusregisterState();
}

class _CusregisterState extends State<Cusregister> {
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
              // controller: _username,
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
              // controller: _password,
              hintText: "Password",
              icon: Icons.lock_open,

              backgroundColor: Colors.white,
              onChanged: (value) {
                print(value);
              },
            ),
            SizedBox(height: 3),
            RoundedTextField(
              // controller: _username,
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
              // controller: _username,
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
              // controller: _username,
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
              // controller: _username,

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
                        TextStyle(color: kBtColor, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {},
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
          hintStyle: TextStyle(color: kTextColor),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
