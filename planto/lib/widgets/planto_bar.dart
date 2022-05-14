import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class PlantoBar extends StatelessWidget {
  const PlantoBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shadowColor: Colors.transparent,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          Container(
              width: MediaQuery.of(context).size.width * 0.2,
              child: Image.asset('label.png'))
        ],
      ),
      backgroundColor: HexColor('e2ffec'),
    );
  }
}
