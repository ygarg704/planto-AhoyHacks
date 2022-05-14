// ignore: import_of_legacy_library_into_null_safe
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:planto/screens/TestScreen.dart';
import 'package:planto/screens/marketScreen.dart';
import 'package:planto/screens/recent.dart';
import 'package:planto/screens/user_screen.dart';

// ignore: must_be_immutable
class Home extends StatefulWidget {
  PageController pageController = PageController();
  Home({
    Key key,
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  var _pages = [TestScreen(), RecentSearch(), MarketScreen(), UserScreen()];
  PageController pageController = PageController();
  @override
  void initState() {
    super.initState();
    pageController.addListener(
      () {
        if (pageController.page.round() != _currentIndex) {
          setState(
            () {
              _currentIndex = pageController.page.round();
            },
          );
        }
      },
    );
  }

  Color activeColor = HexColor("#70ee9c");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        scrollDirection: Axis.horizontal,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavyBar(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) {
          if (index != _currentIndex) {
            setState(() {
              _currentIndex = index;
              pageController.animateToPage(index,
                  duration: Duration(milliseconds: 200), curve: Curves.easeIn);
            });
          }
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            activeColor: activeColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.chrome_reader_mode),
            title: Text('Recent'),
            activeColor: activeColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.store),
            title: Text('Market'),
            activeColor: activeColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.person_outline_outlined),
            title: Text('User'),
            activeColor: activeColor,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
