// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:planto/Model/product_provider.dart';
import 'package:planto/screens/MerchantProfile.dart';
import 'package:planto/screens/edit_product_screen.dart';
import 'package:planto/widgets/user_product_item.dart';
import 'package:provider/provider.dart';
import '../animations/bottomAnimation.dart';
import 'merchant_login.dart';

class MerchantPanel extends StatefulWidget {
  final MerchantDetails detailsUser;

  MerchantPanel({Key key, @required this.detailsUser}) : super(key: key);

  @override
  _MerchantPanelState createState() => _MerchantPanelState();
}

class _MerchantPanelState extends State<MerchantPanel> {
  final GoogleSignIn _gSignIn = GoogleSignIn();

  bool editPanel = false;

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            title: new Text(
              "Are You Sure?",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: new Text("You are about to Log Out!"),
            actions: <Widget>[
              new FlatButton(
                color: Colors.white,
                child: new Text(
                  "Close",
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              new FlatButton(
                color: Colors.white,
                child: new Text(
                  "Log Out",
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: () {
                  _gSignIn.signOut();
                  int count = 0;
                  Navigator.of(context).popUntil((_) => count++ >= 2);
                },
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final productsData = Provider.of<Products>(context);

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
          body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(0, height * 0.05, 0, 0),
              child: Hero(
                tag: 'merchantPic',
                child: FlatButton(
                    shape: CircleBorder(),
                    onPressed: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => MerchantProfile(
                                  merchantDetails: widget.detailsUser)));
                    },
                    child: CircleAvatar(
                        maxRadius: height * 0.03,
                        backgroundColor: Colors.black.withOpacity(0.2),
                        backgroundImage:
                            NetworkImage(widget.detailsUser.photoUrl))),
              ),
            ),
            Container(
              width: width,
              height: height * 0.25,
              margin: EdgeInsets.fromLTRB(width * 0.03, height * 0.1, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: height * 0.05,
                        child: FloatingActionButton(
                          heroTag: 'editBtn',
                          tooltip: 'Edit Panel',
                          backgroundColor:
                              editPanel ? Colors.green : Colors.white,
                          child: editPanel
                              ? WidgetAnimator(
                                  Icon(
                                    Icons.done,
                                    size: height * 0.03,
                                    color: Colors.white,
                                  ),
                                )
                              : WidgetAnimator(
                                  Icon(
                                    Icons.edit,
                                    color: Colors.black,
                                    size: height * 0.03,
                                  ),
                                ),
                          onPressed: () {
                            setState(() {
                              editPanel = !editPanel;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      editPanel
                          ? Container(
                              height: height * 0.045,
                              child: WidgetAnimator(
                                RawMaterialButton(
                                  shape: StadiumBorder(),
                                  fillColor: Colors.blue,
                                  child: Text(
                                    'Add More',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushNamed(EditProductScreen.routeName);
                                  },
                                ),
                              ),
                            )
                          : SizedBox(width: width * 0.245),
                    ],
                  ),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "Merchant's",
                        style: GoogleFonts.abel(
                            fontSize: height * 0.042,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Panel',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, height * 0.325, 0, 0),
              child: ListView.builder(
                itemCount: productsData.items.length,
                itemBuilder: (_, i) => Column(
                  children: [
                    UserProductItem(
                      productsData.items[i].title,
                      productsData.items[i].imageUrl,
                      productsData.items[i].id,
                    ),
                    Divider(),
                  ],
                ),
              ),
            ),
            Positioned(
                top: height * 0.02,
                left: width - 140,
                child: ShaderMask(
                  shaderCallback: (rect) {
                    return LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                        Colors.black.withOpacity(1.0),
                        Colors.black.withOpacity(1.0),
                        Colors.black.withOpacity(1.0),
                        Colors.black.withOpacity(0.1),
                      ],
                    ).createShader(
                        Rect.fromLTRB(0, 0, rect.width, rect.height));
                  },
                  blendMode: BlendMode.dstIn,
                  child: Image(
                      height: height * 0.25,
                      image: AssetImage('assets/merchant.png')),
                )),
          ],
        ),
      )),
    );
  }
}
