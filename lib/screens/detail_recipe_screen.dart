import 'package:flutter/material.dart';
import 'package:foocarie/constants.dart';
import 'package:foocarie/entities/recipe.dart';

class DetailRecipe extends StatefulWidget {
  final Recipe recipe;
  final bool tag;

  const DetailRecipe(this.recipe, this.tag);

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
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(
            top: 64,
            left: 28,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 28),
                  decoration: BoxDecoration(
                    color: kOrangeColor,
                    borderRadius: BorderRadius.circular(
                      8,
                    ),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      widget.recipe.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: kLightColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.5,
                child: Text(
                  widget.recipe.name,
                  style:
                      const TextStyle(fontSize: 36, fontFamily: "HellixBold"),
                ),
              ),
              const SizedBox(height: 24),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "\Budget ",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: "HellixBold",
                        color: kOrangeColor,
                      ),
                    ),
                    TextSpan(
                      text: " Rp ${widget.recipe.price}",
                      style: TextStyle(
                        fontSize: 28,
                        fontFamily: "HellixBold",
                        color: kOrangeColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3.6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Calories",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              fontFamily: "HellixBold",
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "${widget.recipe.calories} Calories",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: "HellixBold",
                            ),
                          ),
                          SizedBox(height: 36),
                          Text(
                            "Time",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              fontFamily: "HellixBold",
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "${widget.recipe.time} mins",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: "HellixBold",
                            ),
                          ),
                          SizedBox(height: 36),
                          Text(
                            "Total Serving",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              fontFamily: "HellixBold",
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "${widget.recipe.serving} serving",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: "HellixBold",
                            ),
                          ),
                        ],
                      ),
                    ),
                    Hero(
                      tag: widget.tag
                          ? "popular${widget.recipe.id}"
                          : "all${widget.recipe.id}",
                      child: Image.asset(
                        widget.recipe.image,
                        height: 250,
                        width: 400,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                "Description",
                style: TextStyle(fontSize: 24, fontFamily: "HellixBold"),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: EdgeInsets.only(right: 28, bottom: 28),
                child: Text(
                  widget.recipe.description,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    fontFamily: "HellixBold",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
