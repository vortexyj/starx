import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class TestPageBody extends StatefulWidget {
  @override
  _TestPageBodyState createState() => _TestPageBodyState();
}

class _TestPageBodyState extends State<TestPageBody> {
  File? _image;
  final ImagePicker _picker = ImagePicker();
  String? _imageUrl;

  Future<void> _pickImage() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      setState(() {
        _image = pickedFile != null ? File(pickedFile.path) : null;
      });
    } on PlatformException catch (e) {
      // TODO
      print("error is : ${e.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Image to Firebase Storage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _image != null ? Image.file(_image!) : Text('No image selected.'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Pick Image'),
            ),
            _imageUrl != null
                ? Text('Download link: $_imageUrl')
                : Text('No image uploaded yet.'),
          ],
        ),
      ),
    );
  }
}
