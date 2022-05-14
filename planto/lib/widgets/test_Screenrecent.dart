import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class TestRecent extends StatelessWidget {
  final String name;
  TestRecent(this.name);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        color: HexColor('E2FFEC'),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: CircleAvatar(
                minRadius: 40,
                maxRadius: 50,
                backgroundImage: AssetImage('leaf.jpg'),
              ),
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: FittedBox(
                      child: Text(
                        name,
                        style:
                            TextStyle(fontSize: 20, color: HexColor('#145E2E')),
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: HexColor('#70EE9C'),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 2),
                      child: Text(
                        'Learn More',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: HexColor('#145E2E')),
                      ),
                    ),
                  )
                ])
          ],
        ),
      ),
    );
  }
}
