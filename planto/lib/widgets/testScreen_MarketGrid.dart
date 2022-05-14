import 'package:flutter/material.dart';
import 'package:planto/Model/product.dart';
import 'package:planto/widgets/TestScreen_market_item.dart';
import 'package:provider/provider.dart';

class TestScreen_MarketGrid extends StatelessWidget {
  const TestScreen_MarketGrid({
    Key key,
    @required this.products,
  }) : super(key: key);

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.23,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(10),
        itemCount: products.length,
        itemBuilder: (context, i) => ChangeNotifierProvider.value(
          value: products[i],
          child: TestScreenMarketItem(),
        ),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          /* crossAxisCount: 1,
          childAspectRatio: 4 / 4,
          mainAxisSpacing: 10, */
        ),
      ),
    );
  }
}
