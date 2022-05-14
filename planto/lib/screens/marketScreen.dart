import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:planto/Model/product_provider.dart';
import 'package:planto/screens/cart_screen.dart';
import 'package:planto/widgets/badge.dart';
import 'package:provider/provider.dart';
import 'package:planto/Model/cart.dart';
import 'package:planto/widgets/products_grid.dart';

enum FilterOptions {
  Favorites,
  All,
}

class MarketScreen extends StatefulWidget {
  static const routeName = '/marketScreen';

  const MarketScreen({Key key}) : super(key: key);

  @override
  _MarketState createState() => _MarketState();
}

class _MarketState extends State<MarketScreen> {
  var _showOnlyFavorites = false;
  var _isInit = true;
  var _isloading = false;

  @override
  void initState() {
    //Provider.of<Products>(context).fetchAndSetProducts(); Won't Work !!
    /* Future.delayed(Duration.zero).then((_) {
      Provider.of<Products>(context).fetchAndSetProducts();
    }); */

    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isloading = true;
      });
      Provider.of<Products>(context).fetchAndSetProducts().then((_) {
        _isloading = false;
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        shadowColor: Colors.transparent,
        backgroundColor: HexColor('e2ffec'),
        foregroundColor: HexColor('145E2E'),
        title: Text('MarketPlace'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorites) {
                  _showOnlyFavorites = true;
                } else {
                  _showOnlyFavorites = false;
                }
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favorites'),
                value: FilterOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: FilterOptions.All,
              ),
            ],
          ),
          Consumer<Cart>(
            builder: (_, cartData, ch) => Badge(
              child: ch,
              value: cartData.itemCount.toString(),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
              icon: Icon(Icons.shopping_cart),
            ),
          ),
        ],
      ),
      body: _isloading
          ? Center(
              child: CupertinoActivityIndicator(),
            )
          : ProductsGrid(_showOnlyFavorites),
    );
  }
}
