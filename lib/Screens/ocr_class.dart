import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
void main() => runApp(Ocr());
class Ocr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.purpleAccent,
      title: 'Student Companion',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File pickedImage;
  var text = '';
  bool imageLoaded = false;
  Future pickImage() async {
//    var camImage = await ImagePicker.pickImage(source: ImageSource.camera);
    var awaitImage = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if(awaitImage!=null)
        {
          pickedImage = awaitImage;
          imageLoaded = true;
        }
      else
        return;
//      else
//        {
//          pickedImage = camImage;
//          imageLoaded = true;
//        }

    });
    FirebaseVisionImage visionImage = FirebaseVisionImage.fromFile(pickedImage);
    TextRecognizer textRecognizer = FirebaseVision.instance.textRecognizer();
    VisionText visionText = await textRecognizer.processImage(visionImage);

    for (TextBlock block in visionText.blocks) {
      for (TextLine line in block.lines) {
        for (TextElement word in line.elements) {
          setState(() {
            text = text + word.text + ' ';
          });
        }
        text = text + '\n';
      }
    }
    textRecognizer.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: 100.0),
          imageLoaded
              ? Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(blurRadius: 20),
                  ],
                ),
                margin: EdgeInsets.fromLTRB(0, 0, 0, 8),
                height: 250,
                child: Image.file(
                  pickedImage,
                  fit: BoxFit.cover,
                ),
              ))
              : Container(),
          SizedBox(height: 10.0),
          Center(
            child: FlatButton.icon(
              icon: Icon(
                Icons.add_a_photo,
                size: 50,
              ),
              label: Text(''),
              textColor: Theme.of(context).primaryColor,
              onPressed: () async {
                pickImage();
              },
            ),
          ),
          SizedBox(height: 10.0),
          SizedBox(height: 10.0),
          text == ''
              ? Text('Text will display here')
              :  Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SelectableText(
                  text,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}