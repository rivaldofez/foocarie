import 'package:flutter/material.dart';
import 'package:foocarie/constants.dart';
import 'package:foocarie/entities/recipe.dart';

class DetailRecipe extends StatefulWidget {
  final Recipe recipe;
  final bool tag;

  const DetailRecipe(this.recipe, this.tag, {Key? key}) : super(key: key);

  @override
  _DetailRecipeState createState() => _DetailRecipeState();
}

class _DetailRecipeState extends State<DetailRecipe> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth <= 700) {
          return DetailRecipeMobile(widget.recipe, widget.tag, 0);
        } else if (constraints.maxWidth <= 1000) {
          return DetailRecipeMobile(widget.recipe, widget.tag, 50);
        } else if (constraints.maxWidth <= 1600) {
          return DetailRecipeMobile(widget.recipe, widget.tag, 100);
        } else {
          return DetailRecipeMobile(widget.recipe, widget.tag, 300);
        }
      },
    );
  }
}

class DetailRecipeMobile extends StatelessWidget {
  final Recipe recipe;
  final bool tag;
  final double margin;

  const DetailRecipeMobile(this.recipe, this.tag, this.margin, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: margin),
      child: Scaffold(
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
                        recipe.isFavorite
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
                    recipe.name,
                    style:
                        const TextStyle(fontSize: 36, fontFamily: "HellixBold"),
                  ),
                ),
                const SizedBox(height: 24),
                Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: "Budget ",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: "HellixBold",
                          color: kOrangeColor,
                        ),
                      ),
                      TextSpan(
                        text: "\nRp ${recipe.price}",
                        style: const TextStyle(
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
                            const Text(
                              "Calories",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                                fontFamily: "HellixBold",
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "${recipe.calories} Calories",
                              style: const TextStyle(
                                fontSize: 20,
                                fontFamily: "HellixBold",
                              ),
                            ),
                            const SizedBox(height: 36),
                            const Text(
                              "Time",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                                fontFamily: "HellixBold",
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "${recipe.time} mins",
                              style: const TextStyle(
                                fontSize: 20,
                                fontFamily: "HellixBold",
                              ),
                            ),
                            const SizedBox(height: 36),
                            const Text(
                              "Total Serving",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                                fontFamily: "HellixBold",
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "${recipe.serving} serving",
                              style: const TextStyle(
                                fontSize: 20,
                                fontFamily: "HellixBold",
                              ),
                            ),
                          ],
                        ),
                      ),
                      Hero(
                        tag: tag ? "popular${recipe.id}" : "all${recipe.id}",
                        child: Image.asset(
                          recipe.image,
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
                  padding: const EdgeInsets.only(right: 28, bottom: 28),
                  child: Text(
                    recipe.description,
                    style: const TextStyle(
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
      ),
    );
  }
}
