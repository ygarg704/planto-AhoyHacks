import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TestScreenImage extends StatelessWidget {
  const TestScreenImage({
    Key key,
    @required PickedFile image,
  })  : _image = image,
        super(key: key);

  final PickedFile _image;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height * 0.5,
      child: Card(
        elevation: 20,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.file(File(_image.path)),
        ),
      ),
      //),
    );
  }
}
