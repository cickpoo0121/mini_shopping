import 'package:flutter/material.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/views/components/drawer.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
          style: TextStyle(color: kTextColor, fontWeight: FontWeight.bold),
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
        child: Padding(
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
                              "Mr.John Jackson",
                              style: TextStyle(color: kTextColor),
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
                            Text("John_Jackson@gmail.com",
                                style: TextStyle(color: kTextColor))
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
                            Text("016-1329986",
                                style: TextStyle(color: kTextColor))
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
                          color: kBtColor, fontWeight: FontWeight.bold),
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
