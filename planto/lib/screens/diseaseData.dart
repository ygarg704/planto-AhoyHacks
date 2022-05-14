import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'package:hexcolor/hexcolor.dart';
import 'package:planto/Model/diseasemodel.dart';
import 'package:planto/widgets/disease_Text.dart';

// ignore: must_be_immutable
class DiseaseData extends StatefulWidget {
  final String value;
  var img;

  DiseaseData({this.value, this.img});

  @override
  _DiseaseDataState createState() => _DiseaseDataState(value, img);
}

class _DiseaseDataState extends State<DiseaseData> {
  String value;
  File img;
  bool isloading = false;
  List<DiseaseModel> diseaseModel = [];

  _DiseaseDataState(this.value, this.img);

  /* Future uploadImageToFirebase(BuildContext context) async {
    String fileName = basename(value);
    FirebaseStorage firebaseStorageRef = FirebaseStorage.instance;
    Reference ref = firebaseStorageRef.ref().child('uploads/$fileName');
    UploadTask uploadTask = ref.putFile(img);
    uploadTask.then((res) {
      res.ref.getDownloadURL();
      print('File Uploaded');
    });
  } */

  Future<void> sendData() async {
    setState(() {
      isloading = true;
    });
    http.post(
      (Uri.parse(
          "https://planto-965f9-default-rtdb.firebaseio.com/sample.json")),
      body: json.encode(
        {
          //'SampleImage': img,
          'name': value,
        },
      ),
    );
    setState(
      () {
        isloading = false;
      },
    );
    /* setState(() {
      diseaseModel.add(DiseaseModel(
        value: value,
        //imageUrl: img,
      ));
    }); */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(value),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection(value).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something Went Wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CupertinoActivityIndicator());
          }

          return Container(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  diseaseText(context, snapshot),
                  TestImage(context),
                  Padding(
                    padding: const EdgeInsets.only(top: 640),
                    child: InkWell(
                      onTap: () {
                        sendData();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Saved'),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(6),
                        width: MediaQuery.of(context).size.width * 0.89,
                        decoration: BoxDecoration(
                            color: HexColor('70EE9C'),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Save for Later',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Padding TestImage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.height * 0.2,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.file(img, fit: BoxFit.cover)),
      ),
    );
  }
}
