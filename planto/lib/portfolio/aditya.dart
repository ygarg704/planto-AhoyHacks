import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore: must_be_immutable
class Aditya extends StatefulWidget {
  @override
  _AdityaState createState() => _AdityaState();
}

class _AdityaState extends State<Aditya> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'planto',
          style: TextStyle(color: HexColor('#145E2E')),
        ),
        centerTitle: true,
        leading: BackButton(
          color: HexColor('#145E2E'),
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: WebView(
          initialUrl: 'https://adicadi.github.io/',
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
