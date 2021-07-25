import 'package:flutter/material.dart';
import 'package:foocarie/constants.dart';

class DetailRecipe extends StatefulWidget {
  @override
  _DetailRecipeState createState() => _DetailRecipeState();
}

class _DetailRecipeState extends State<DetailRecipe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightColor,
      bottomNavigationBar: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Container(
          height: 58,
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(
            horizontal: 32,
          ),
          decoration: BoxDecoration(
            color: kOrangeColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(38),
              topRight: Radius.circular(38),
            ),
          ),
          child: Text(
            "Back",
            style: TextStyle(
              fontSize: 24.0,
              fontFamily: "HellixBold",
              color: kLightColor,
            ),
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(
          top: 64,
          left: 28,
        ),
        child: Text(
          "Name",
          style: TextStyle(fontSize: 36, fontFamily: "HellixBold"),
        ),
      ),
    );
  }
}
