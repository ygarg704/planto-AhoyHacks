import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:planto/Model/cart.dart' show Cart;
import 'package:planto/Model/orders.dart';
import 'package:planto/widgets/cart_item.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        shadowColor: Colors.transparent,
        backgroundColor: HexColor('e2ffec'),
        foregroundColor: HexColor('145E2E'),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Spacer(),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: Chip(
                      elevation: 10,
                      label: Text(
                        '\u{20B9}${cart.totalAmount.toStringAsFixed(2)}',
                        //style: Theme.of(context).textTheme.headline2,
                      ),
                      backgroundColor: HexColor('e2ffec'),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Provider.of<Orders>(context, listen: false).addOrder(
                        cart.items.values.toList(),
                        cart.totalAmount,
                      );
                      cart.clear();
                    },
                    child: Text(
                      'Order Now',
                      style: TextStyle(color: HexColor('145E2E')),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
              child: ListView.builder(
            itemBuilder: (context, i) => CartItem(
              cart.items.values.toList()[i].id,
              cart.items.values.toList()[i].title,
              cart.items.values.toList()[i].price,
              cart.items.values.toList()[i].quantity,
              cart.items.keys.toList()[i],
            ),
            itemCount: cart.itemCount,
          )),
        ],
      ),
    );
  }
}
