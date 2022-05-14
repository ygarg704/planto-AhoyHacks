import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:planto/screens/about.dart';
import 'package:planto/screens/orders_screen.dart';
import 'package:planto/widgets/planto_bar.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60), child: PlantoBar()),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
            child: Row(
              children: [
                CircleAvatar(
                  minRadius: 40,
                  maxRadius: 50,
                  backgroundImage: AssetImage('user.png'),
                ),
                SizedBox(
                  width: 20,
                ),
                Text('Hello user',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: HexColor('#145E2E'))),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 40, 10, 10),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              elevation: 5,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 8),
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Profile',
                            style: TextStyle(
                                fontSize: 15, color: HexColor('#145E2E')),
                          ),
                          Icon(Icons.arrow_forward_ios_rounded,
                              color: HexColor('#145E2E')),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: HexColor('#145E2E'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(OrdersScreen.routeName);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Your Orders',
                            style: TextStyle(
                                fontSize: 15, color: HexColor('#145E2E')),
                          ),
                          Icon(Icons.arrow_forward_ios_rounded,
                              color: HexColor('#145E2E')),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: HexColor('#145E2E'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Settings',
                            style: TextStyle(
                                fontSize: 15, color: HexColor('#145E2E')),
                          ),
                          Icon(Icons.arrow_forward_ios_rounded,
                              color: HexColor('#145E2E')),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: HexColor('#145E2E'),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 8, 10, 15),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => About()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'About',
                            style: TextStyle(
                                fontSize: 15, color: HexColor('#145E2E')),
                          ),
                          Icon(Icons.arrow_forward_ios_rounded,
                              color: HexColor('#145E2E')),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
        ],
      ),
    );
  }
}
