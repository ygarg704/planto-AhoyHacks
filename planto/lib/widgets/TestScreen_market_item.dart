import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:planto/Model/product.dart';
import 'package:planto/screens/product_detail.dart';
import 'package:provider/provider.dart';

class TestScreenMarketItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    double width = MediaQuery.of(context).size.width;

    return /* GridTile(
        child:  */

        Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 5,
      color: HexColor('e2ffec'),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .pushNamed(ProductDetail.routeName, arguments: product.id);
            },
            child: product.imageUrl == null
                ? Container(
                    child: CupertinoActivityIndicator(),
                  )
                : CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.13,
                    backgroundImage: NetworkImage(product.imageUrl),
                  ),
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            elevation: 3,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: HexColor('70EE9C'),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              child: FittedBox(
                child: Text(
                  product.title,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle(
                      fontSize: width * 0.043,
                      fontWeight: FontWeight.w400,
                      color: HexColor('145E2E')),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
