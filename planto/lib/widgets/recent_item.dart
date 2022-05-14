import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class RecentItem extends StatelessWidget {
  final String name;
  RecentItem(this.name);

  @override
  Widget build(BuildContext context) {
    return /* Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: */
        Card(
      color: HexColor('E2FFEC'),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: CircleAvatar(
              minRadius: 35,
              maxRadius: 40,
              backgroundImage: AssetImage('leaf.jpg'),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 10),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Text(
                name,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
      //),
    );
  }
}
