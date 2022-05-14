import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore: must_be_immutable
class Arpit extends StatefulWidget {
  @override
  _ArpitState createState() => _ArpitState();
}

class _ArpitState extends State<Arpit> {
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
          initialUrl: 'https://www.behance.net/masiharpit',
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
