import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:planto/Model/cart.dart';
import 'package:planto/Model/diseaseProvider.dart';
import 'package:planto/Model/orders.dart';
import 'package:planto/Model/product_provider.dart';
import 'package:planto/screens/Intro.dart';
import 'package:planto/screens/cart_screen.dart';
import 'package:planto/screens/edit_product_screen.dart';
import 'package:planto/screens/marketScreen.dart';
import 'package:planto/screens/merchant_login.dart';
import 'package:planto/screens/orders_screen.dart';
import 'package:planto/screens/product_detail.dart';
import 'package:planto/screens/user_login.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Disease()),
        ChangeNotifierProvider(
          create: (context) => Products(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (context) => Orders(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        theme: ThemeData(
            fontFamily: 'Poppins',
            textTheme: TextTheme(
              headline1: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              bodyText1: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            colorScheme: ColorScheme.fromSwatch()
                .copyWith(secondary: HexColor('#031D07'))),
        title: 'plantO',
        home: Intro(),
        routes: {
          MarketScreen.routeName: (context) => MarketScreen(),
          ProductDetail.routeName: (context) => ProductDetail(),
          CartScreen.routeName: (context) => CartScreen(),
          OrdersScreen.routeName: (context) => OrdersScreen(),
          EditProductScreen.routeName: (context) => EditProductScreen(),
          '/MerchantLogin': (context) => MerchantLogin(),
          '/UserLogin': (context) => UserLogin(),
        },
        //),
      ),
    );
  }
}
