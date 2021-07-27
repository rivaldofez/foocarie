import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foocarie/entities/recipe.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

import '../constants.dart';
import 'detail_recipe_screen.dart';

class RecipePredictorScreen extends StatefulWidget {
  final List<Recipe> allRecipe;

  const RecipePredictorScreen(this.allRecipe, {Key? key}) : super(key: key);

  @override
  _RecipePredictorScreenState createState() => _RecipePredictorScreenState();
}

class _RecipePredictorScreenState extends State<RecipePredictorScreen> {
  File? imagePicked;
  bool isImageLoaded = false;

  List _result = [];

  String _confidence = "";
  String _name = "";
  String numbers = "";
  Recipe? predictedRecipe;

  getImageFromGallery() async {
    var temp = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (temp != null) {
      setState(() {
        imagePicked = File(temp.path);
        isImageLoaded = true;
        predictImage(File(temp.path));
      });
    } else {
      Fluttertoast.showToast(
          msg: "Image not selected or not valid", fontSize: 10);
      setState(() {
        isImageLoaded = false;
      });
    }
  }

  loadRecipeModel() async {
    await Tflite.loadModel(
        labels: "assets/models/labels.txt",
        model: "assets/models/model.tflite");
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
      _result = res ?? [];

      String str = _result[0]["label"];

      _name = str.substring(2);
      _confidence = _result != []
          ? (_result[0]["confidence"] * 100.0).toString().substring(0, 2) + "%"
          : "";

      if (_result != []) {
        predictedRecipe = widget.allRecipe[searchIndexRecipe(_name)];
      } else {
        predictedRecipe = null;
      }
    });
  }

  int searchIndexRecipe(String id) {
    int index = 0;
    for (int i = 0; i < widget.allRecipe.length; i++) {
      if (widget.allRecipe[i].id == id) {
        index = i;
      }
    }
    return index;
  }

  @override
  void initState() {
    super.initState();
    loadRecipeModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Container(
          height: 58,
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(
            horizontal: 32,
          ),
          decoration: const BoxDecoration(
            color: kOrangeColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(38),
              topRight: Radius.circular(38),
            ),
          ),
          child: const Text(
            "Back",
            style: TextStyle(
              fontSize: 24.0,
              fontFamily: "HellixBold",
              color: kLightColor,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              const SizedBox(height: 24),
              const Text(
                "Food Calorie Checker",
                style: TextStyle(fontSize: 24, fontFamily: "HellixBold"),
              ),
              const SizedBox(height: 28),
              isImageLoaded
                  ? Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: FileImage(
                            File(imagePicked!.path),
                          ),
                          fit: BoxFit.contain,
                        ),
                      ),
                    )
                  : Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        color: kOrangeColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Center(
                        child: Text(
                          "Select an image first",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: "HellixBold"),
                        ),
                      ),
                    ),
              const SizedBox(height: 30),
              isImageLoaded
                  ? predictedRecipe != null
                      ? GestureDetector(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailRecipe(predictedRecipe!, false),
                            ),
                          ),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 0,
                            ),
                            margin: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                Hero(
                                  tag: "all${predictedRecipe!.id}",
                                  child: Image.asset(
                                    predictedRecipe!.image,
                                    height: 180,
                                    width: 120,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Accuracy $_confidence",
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: kBlueColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 6),
                                        Text(
                                          predictedRecipe!.name,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontFamily: "HellixBold",
                                          ),
                                        ),
                                        Row(
                                          children: List.generate(
                                            5,
                                            (index) => const Icon(
                                              Icons.star,
                                              color: kOrangeColor,
                                              size: 16,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 6),
                                        const SizedBox(height: 6),
                                        Text(
                                          "${predictedRecipe!.calories} Calories",
                                          style: const TextStyle(
                                              fontSize: 14,
                                              color: kOrangeColor,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(height: 6),
                                        Row(
                                          children: [
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.access_time,
                                                  color: Colors.grey,
                                                  size: 14,
                                                ),
                                                const SizedBox(width: 8),
                                                Text(
                                                  "${predictedRecipe!.time} Min",
                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(width: 16),
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                  "assets/icons/bell.svg",
                                                  height: 14,
                                                  color: Colors.grey,
                                                ),
                                                const SizedBox(width: 8),
                                                Text(
                                                  "${predictedRecipe!.serving} Serving",
                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Container()
                  : Container(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getImageFromGallery();
        },
        child: const Icon(Icons.camera),
        backgroundColor: kOrangeColor,
      ),
    );
  }
}
