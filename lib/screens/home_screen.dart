import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foocarie/constants.dart';
import 'package:foocarie/entities/recipe.dart';
import 'package:foocarie/screens/detail_recipe_screen.dart';
import 'package:foocarie/screens/recipe_predictor.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool tag = false;
  List<Recipe> _popularRecipe = [];
  List<Recipe> _recommendedRecipe = [];

  @override
  void initState() {
    super.initState();
    fetchPopularRecipe().then((value) {
      setState(() {
        _popularRecipe.addAll(value);
      });
    });

    fetchPopularRecipe().then((value) {
      setState(() {
        _recommendedRecipe.addAll(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset(
                        "assets/icons/menu.svg",
                        height: 32.0,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => print("notifications"),
                      child: SvgPicture.asset(
                        "assets/icons/notification.svg",
                        height: 32.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  "Hello, Rivaldo Fernandes",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  "What do you want to cook today?",
                  style: TextStyle(
                    fontSize: 28.0,
                    fontFamily: "HellixBold",
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 6,
                          horizontal: 8,
                        ),
                        decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(14)),
                        child: const TextField(
                          cursorColor: kDarkColor,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.grey,
                              size: 34,
                            ),
                            hintText: "Search for recipes",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    GestureDetector(
                      onTap: () => print("settings"),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 18,
                          horizontal: 18,
                        ),
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: SvgPicture.asset(
                          "assets/icons/settings.svg",
                          height: 22,
                          color: kDarkColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Popular Diet Recipe",
                      style: TextStyle(fontSize: 22, fontFamily: "HellixBold"),
                    ),
                    GestureDetector(
                      onTap: () => print("see all"),
                      child: const Text(
                        "See All",
                        style: TextStyle(
                            fontSize: 18,
                            color: kOrangeColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 240,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: _popularRecipe.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DetailRecipe(
                                index,
                                _popularRecipe[index].name,
                                _popularRecipe[index].image,
                                tag = true),
                          ),
                        ),
                        child: Container(
                          margin: const EdgeInsets.only(right: 32),
                          width: 200,
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 8),
                              Hero(
                                tag: "fresh$index",
                                child: Image.asset(
                                  _popularRecipe[index].image,
                                  height: 100,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Breakfast",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: kBlueColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    SizedBox(
                                      width: 180,
                                      child: Text(
                                        _popularRecipe[index].name,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontFamily: "HellixBold",
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
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
                                    const SizedBox(height: 6),
                                    const Text(
                                      "120 Calories",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: kOrangeColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Row(
                                          children: const [
                                            Icon(
                                              Icons.access_time,
                                              color: Colors.grey,
                                              size: 14,
                                            ),
                                            SizedBox(width: 8),
                                            Text(
                                              "10 Min",
                                              style: TextStyle(
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
                                            const Text(
                                              "1 Serving",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Recommended",
                      style: TextStyle(fontSize: 22, fontFamily: "HellixBold"),
                    ),
                    GestureDetector(
                      onTap: () => print("see recommended"),
                      child: const Text(
                        "See All",
                        style: TextStyle(
                            fontSize: 18,
                            color: kOrangeColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _recommendedRecipe.length,
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DetailRecipe(
                              index,
                              _recommendedRecipe[index].name,
                              _recommendedRecipe[index].image,
                              tag = false),
                        ),
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 0,
                        ),
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Hero(
                              tag: "recommended$index",
                              child: Image.asset(
                                _recommendedRecipe[index].image,
                                height: 180,
                                width: 120,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Breakfast",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: kBlueColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      _recommendedRecipe[index].image,
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
                                    const SizedBox(height: 6),
                                    const Text(
                                      "120 Calories",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: kOrangeColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 6),
                                    Row(
                                      children: [
                                        Row(
                                          children: const [
                                            Icon(
                                              Icons.access_time,
                                              color: Colors.grey,
                                              size: 14,
                                            ),
                                            SizedBox(width: 8),
                                            Text(
                                              "10 Min",
                                              style: TextStyle(
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
                                            const Text(
                                              "1 Serving",
                                              style: TextStyle(
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
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => RecipePredictorScreen(),
          ),
        ),
        child: const Icon(Icons.image_search),
        backgroundColor: kOrangeColor,
      ),
    );
  }
}

Future<List<Recipe>> fetchPopularRecipe() async {
  String data = await rootBundle.loadString("assets/json/popular.json");
  var jsonResult = json.decode(data);

  List<Recipe> recipes = [];

  for (var recipe in jsonResult) {
    recipes.add(Recipe.fromJson(recipe));
  }
  return recipes;
}
