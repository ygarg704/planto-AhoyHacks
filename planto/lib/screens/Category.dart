// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:planto/animations/bottomAnimation.dart';

class Category extends StatefulWidget {
  const Category({Key key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    Future<bool> _onWillPop() async {
      return (await showDialog(
            context: context,
            builder: (context) => new AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              title: new Text(
                "Exit Application",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              content: new Text("Are You Sure?"),
              actions: <Widget>[
                // usually buttons at the bottom of the dialog
                ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      StadiumBorder(),
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  child: new Text(
                    "No",
                    style: TextStyle(color: Colors.blue),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),

                ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      StadiumBorder(),
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  child: new Text(
                    "Yes",
                    style: TextStyle(color: Colors.red),
                  ),
                  onPressed: () {
                    exit(0);
                  },
                ),
              ],
            ),
          )) ??
          false;
    }

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: height * 0.065,
              ),
              Container(
                margin: EdgeInsets.only(left: width * 0.05),
                width: width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Category',
                      style: TextStyle(
                          color: Colors.black, fontSize: height * 0.04),
                    ),
                    FlatButton(
                      shape: CircleBorder(),
                      onPressed: () => Navigator.pushNamed(context, '/AboutUs'),
                      child: Icon(
                        Icons.info,
                        size: height * 0.04,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: height * 0.09),
              Column(
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.black.withOpacity(0.2),
                    radius: height * 0.075,
                    child: Image(
                      image: AssetImage("assets/merchant.png"),
                      height: height * 0.2,
                    ),
                  ),
                  WidgetAnimator(adminUserBtn('Seller', context)),
                  SizedBox(
                    height: height * 0.1,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.black.withOpacity(0.2),
                    radius: height * 0.075,
                    child: Image(
                      image: AssetImage("assets/customer.png"),
                      height: height * 0.2,
                    ),
                  ),
                  WidgetAnimator(adminUserBtn('Customer', context)),
                  SizedBox(
                    height: height * 0.13,
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        'Version',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'V 1.0',
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget adminUserBtn(String categoryText, context) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.05,
    width: MediaQuery.of(context).size.width * 0.5,
    child: RaisedButton(
      onPressed: () {
        if (categoryText == 'Seller') {
          Navigator.pushNamed(context, '/MerchantLogin');
        } else {
          Navigator.pushNamed(context, '/UserLogin');
        }
      },
      color: Colors.white,
      child: Text("I am " + categoryText),
      shape: StadiumBorder(),
    ),
  );
}
