import 'package:flutter/material.dart';

class Cusregister extends StatefulWidget {
  @override
  _CusregisterState createState() => _CusregisterState();
}

class _CusregisterState extends State<Cusregister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.supervised_user_circle_rounded,
                color: Colors.blue,
                size: 120.0,
              ),
              SizedBox(height: 20),
              RoundedTextField(
                // controller: _username,
                hintText: "Username",
                icon: Icons.perm_identity_outlined,
                // color: kTextColor,
                color: Colors.black,
                backgroundColor: Colors.white,
                onChanged: (value) {
                  print(value);
                },
              ),
              SizedBox(height: 8),
              RoundedTextField(
                // controller: _password,
                hintText: "Password",
                icon: Icons.lock_open,
                color: Colors.black,
                backgroundColor: Colors.white,
                onChanged: (value) {
                  print(value);
                },
              ),
              RoundedTextField(
                // controller: _username,
                hintText: "Confrim Password",
                icon: Icons.lock_open,
                // color: kTextColor,
                color: Colors.black,
                backgroundColor: Colors.white,
                onChanged: (value) {
                  print(value);
                },
              ),
              SizedBox(height: 8),
              RoundedTextField(
                // controller: _username,
                hintText: "Fullname",
                icon: Icons.account_box_rounded,
                // color: kTextColor,
                color: Colors.black,
                backgroundColor: Colors.white,
                onChanged: (value) {
                  print(value);
                },
              ),
              SizedBox(height: 8),
              RoundedTextField(
                // controller: _username,
                hintText: "Email",
                icon: Icons.email_rounded,
                // color: kTextColor,
                color: Colors.black,
                backgroundColor: Colors.white,
                onChanged: (value) {
                  print(value);
                },
              ),
              SizedBox(height: 8),
              RoundedTextField(
                // controller: _username,
                hintText: "Tel",
                icon: Icons.phone,
                // color: kTextColor,
                color: Colors.black,
                backgroundColor: Colors.white,
                onChanged: (value) {
                  print(value);
                },
              ),
              SizedBox(height: 8),
              ButtonTheme(
                minWidth: 300.0,
                height: 50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(44, 20, 44, 5),
                  child: RaisedButton(
                    elevation: 2.0,
                    hoverColor: Colors.green,
                    color: Color.fromRGBO(56, 163, 165, 10),
                    child: Text(
                      "Register",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {},
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
            color: color,
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: color),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
