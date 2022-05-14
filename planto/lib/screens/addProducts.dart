import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planto/animations/bottomAnimation.dart';
import 'package:planto/widgets/backBtnAndImage.dart';

final controllerName = TextEditingController();
final controllerPrice = TextEditingController();
final controllerDesc = TextEditingController();
final controllerImageUrl = TextEditingController();

class AddProduct extends StatefulWidget {
  final String merchantName;
  final String merchantMail;
  AddProduct({this.merchantName, this.merchantMail});

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  bool validName = false;
  bool validPrice = false;
  bool validDesc = false;
  bool validImageUrl = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    final disNameTF = TextField(
      keyboardType: TextInputType.text,
      autofocus: false,
      controller: controllerName,
      onSubmitted: (_) => FocusScope.of(context).nextFocus(),
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          labelText: 'Name',
          filled: true,
          fillColor: Colors.black.withOpacity(0.05),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
    final medNameTF = TextField(
      keyboardType: TextInputType.number,
      autofocus: false,
      controller: controllerPrice,
      onSubmitted: (_) => FocusScope.of(context).nextFocus(),
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          labelText: 'Price',
          filled: true,
          fillColor: Colors.black.withOpacity(0.05),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
    final medTimeTF = TextField(
      keyboardType: TextInputType.text,
      autofocus: false,
      controller: controllerDesc,
      onSubmitted: (_) => FocusScope.of(context).nextFocus(),
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          labelText: 'Description',
          filled: true,
          fillColor: Colors.black.withOpacity(0.05),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
    final medDescTF = TextField(
      keyboardType: TextInputType.url,
      autofocus: false,
      controller: controllerImageUrl,
      maxLines: null,
      decoration: InputDecoration(
          prefixIcon: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: WidgetAnimator(
              Image(
                image: AssetImage('assets/steth.png'),
                height: height * 0.04,
              ),
            ),
          ),
          labelText: 'Image',
          filled: true,
          fillColor: Colors.black.withOpacity(0.05),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );

    controllerClear() {
      controllerName.clear();
      controllerDesc.clear();
      controllerImageUrl.clear();
      controllerPrice.clear();
    }

    addingDisease() {
      FirebaseFirestore.instance
          .collection('products')
          .doc(controllerName.text)
          .set({
        'Name': controllerName.text,
        'desc': controllerDesc.text,
        'Price': controllerPrice.text,
        'Image': controllerImageUrl.text,
        'post': widget.merchantName,
        'docEmail': widget.merchantMail,
      });
      controllerClear();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Product Added'),
        duration: Duration(seconds: 1),
      ));

      Navigator.pop(context);
    }

    final addBtn = Container(
        width: double.infinity,
        height: 50,
        child: RaisedButton(
          onPressed: () {
            setState(() {
              controllerName.text.isEmpty
                  ? validName = true
                  : validName = false;
              controllerDesc.text.isEmpty
                  ? validDesc = true
                  : validDesc = false;
              controllerPrice.text.isEmpty
                  ? validPrice = true
                  : validPrice = false;
              controllerImageUrl.text.isEmpty
                  ? validImageUrl = true
                  : validImageUrl = false;
            });
            !validName & !validDesc & !validPrice & !validImageUrl
                ? addingDisease()
                : ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Please fill all the fields'),
                    duration: Duration(seconds: 1),
                  ));
          },
          color: Colors.white,
          shape: StadiumBorder(),
          child: Text(
            'Add',
            style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2),
          ),
        ));

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              width: width,
              margin: EdgeInsets.fromLTRB(width * 0.025, 0, width * 0.025, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  BackBtn(),
                  SizedBox(height: height * 0.05),
                  Row(
                    children: <Widget>[
                      Text(
                        'Adding',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: height * 0.04),
                      ),
                      SizedBox(width: height * 0.015),
                      Text('Products',
                          style: GoogleFonts.abel(fontSize: height * 0.04))
                    ],
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Text(
                    'Enter the Following Information',
                    style: GoogleFonts.abel(fontSize: height * 0.025),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  disNameTF,
                  SizedBox(
                    height: height * 0.015,
                  ),
                  medNameTF,
                  SizedBox(
                    height: height * 0.015,
                  ),
                  medTimeTF,
                  SizedBox(
                    height: height * 0.015,
                  ),
                  medDescTF,
                  SizedBox(
                    height: height * 0.02,
                  ),
                  addBtn,
                  SizedBox(
                    height: height * 0.01,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
