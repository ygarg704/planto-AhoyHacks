import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:planto/Model/cart.dart';

import 'package:planto/Model/product_provider.dart';
import 'package:planto/screens/cart_screen.dart';
import 'package:provider/provider.dart';

class ProductDetail extends StatelessWidget {
  static const routeName = '/product-detail';
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;

    final stockedProduct =
        Provider.of<Products>(context, listen: false).findById(productId);
    final cart = Provider.of<Cart>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(stockedProduct.title),
        shadowColor: Colors.transparent,
        backgroundColor: HexColor('e2ffec'),
        foregroundColor: HexColor('145E2E'),
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(
              stockedProduct.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          Text(
            '\u{20B9}${stockedProduct.price}',
            style: Theme.of(context).textTheme.headline1,
          ),
          Divider(
            indent: 10,
            thickness: 2,
            color: HexColor('145E2E'),
            endIndent: 10,
          ),
          SizedBox(height: 10),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.4,
              child: Text(
                stockedProduct.description,
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(HexColor('70EE9C')),
              foregroundColor: MaterialStateProperty.all(HexColor('145E2E')),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
            ),
            onPressed: () {
              cart.addItem(stockedProduct.id, stockedProduct.price,
                  stockedProduct.title);
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => CartScreen())));
            },
            child: Text(
              'Buy Now',
              style: TextStyle(fontSize: 15),
            ),
          )
        ],
      ),
    );
  }
}
