import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class RecipePredictorScreen extends StatefulWidget {
  @override
  _RecipePredictorScreenState createState() => _RecipePredictorScreenState();
}

class _RecipePredictorScreenState extends State<RecipePredictorScreen> {
  File? imagePicked = null;
  bool isImageLoaded = false;

  List _result = [];

  String _confidence = "";
  String _name = "";
  String numbers = "";

  getImageFromGallery() async {
    var temp = await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      imagePicked = File(temp!.path);
      isImageLoaded = true;
      predictImage(File(temp!.path));
    });
  }

  loadRecipeModel() async {
    var result = await Tflite.loadModel(
        labels: "assets/models/labels.txt",
        model: "assets/models/model.tflite");

    print("Result after loading : $result");
  }

  predictImage(File file) async {
    var res = await Tflite.runModelOnImage(
      path: file.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );

    setState(() {
      _result = res!;

      String str = _result[0]["label"];

      _name = str.substring(2);
      _confidence = _result != null
          ? (_result[0]["confidence"] * 100.0).toString().substring(0, 2) + "%"
          : "";
    });
  }

  @override
  void initState() {
    super.initState();
    loadRecipeModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TfLite Demo"),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 30),
            isImageLoaded
                ? Center(
                    child: Container(
                      height: 350,
                      width: 350,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: FileImage(
                              File(imagePicked!.path),
                            ),
                            fit: BoxFit.contain),
                      ),
                    ),
                  )
                : Container(),
            Text("Name ; $_name \n Confidence: $_confidence"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getImageFromGallery();
        },
        child: Icon(Icons.photo_album),
      ),
    );
  }
}
