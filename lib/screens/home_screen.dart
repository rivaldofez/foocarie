import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
  final List<Recipe> _popularRecipe = [];
  final List<Recipe> _allRecipe = [];

  @override
  void initState() {
    super.initState();
    fetchPopularRecipe().then((value) {
      setState(() {
        _popularRecipe.addAll(value);
      });
    });

    fetchAllRecipe().then((value) {
      setState(() {
        _allRecipe.addAll(value);
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
                      onTap: () {
                        Fluttertoast.showToast(
                            msg: "Notification Feature on Progress",
                            fontSize: 10);
                      },
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
                      onTap: () => Fluttertoast.showToast(
                          msg: "Settings Feature on Progress", fontSize: 10),
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
                      onTap: () => Fluttertoast.showToast(
                          msg: "See All Feature on Progress", fontSize: 10),
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
                            builder: (context) =>
                                DetailRecipe(_popularRecipe[index], tag = true),
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
                              const SizedBox(height: 8),
                              Hero(
                                tag: "popular${_popularRecipe[index].id}",
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
                                    Text(
                                      _popularRecipe[index].categories,
                                      style: const TextStyle(
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
                                    Text(
                                      "${_popularRecipe[index].calories} Calories",
                                      style: const TextStyle(
                                          fontSize: 14,
                                          color: kOrangeColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 8),
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
                                              "${_popularRecipe[index].time} Min",
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
                                              "${_popularRecipe[index].serving} Serving",
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
                      "All Recipes",
                      style: TextStyle(fontSize: 22, fontFamily: "HellixBold"),
                    ),
                    GestureDetector(
                      onTap: () => Fluttertoast.showToast(
                          msg: "Recommended Feature on Progress", fontSize: 10),
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
                LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    if (constraints.maxWidth <= 700) {
                      return RecipeListWidget(_allRecipe);
                    } else if (constraints.maxWidth <= 1000) {
                      return RecipeGridWidget(_allRecipe, 2);
                    } else if (constraints.maxWidth <= 1600) {
                      return RecipeGridWidget(_allRecipe, 3);
                    } else {
                      return RecipeGridWidget(_allRecipe, 4);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (kIsWeb) {
            Fluttertoast.showToast(
                msg:
                    "Feature not available on web, change yout device to mobile",
                fontSize: 10);
          } else {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => RecipePredictorScreen(_allRecipe),
              ),
            );
          }
        },
        child: const Icon(Icons.image_search),
        backgroundColor: kOrangeColor,
      ),
    );
  }
}

class RecipeListWidget extends StatelessWidget {
  final List<Recipe> _allRecipe;

  const RecipeListWidget(this._allRecipe, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _allRecipe.length,
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => DetailRecipe(_allRecipe[index], false),
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
                  tag: "all${_allRecipe[index].id}",
                  child: Image.asset(
                    _allRecipe[index].image,
                    height: 180,
                    width: 120,
                    fit: BoxFit.contain,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _allRecipe[index].categories,
                          style: const TextStyle(
                            fontSize: 14,
                            color: kBlueColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          _allRecipe[index].name,
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
                        Text(
                          "${_allRecipe[index].calories} Calories",
                          style: const TextStyle(
                              fontSize: 14,
                              color: kOrangeColor,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 6),
                        Column(
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
                                  "${_allRecipe[index].time} Min",
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.grey),
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
                                  "${_allRecipe[index].serving} Serving",
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.grey),
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
    );
  }
}

class RecipeGridWidget extends StatelessWidget {
  final List<Recipe> _allRecipe;
  final int gridCount;

  const RecipeGridWidget(this._allRecipe, this.gridCount, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      isAlwaysShown: true,
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: gridCount,
        padding: EdgeInsets.zero,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: _allRecipe.map(
          (recipe) {
            return GestureDetector(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DetailRecipe(recipe, false),
                ),
              ),
              child: Container(
                height: 400,
                width: 200,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 0,
                ),
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                      tag: "all${recipe.id}",
                      child: Image.asset(
                        recipe.image,
                        height: 200,
                        width: 230,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            recipe.categories,
                            style: const TextStyle(
                              fontSize: 14,
                              color: kBlueColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            recipe.name,
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
                          Text(
                            "${recipe.calories} Calories",
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
                                    "${recipe.time} Min",
                                    style: const TextStyle(
                                        fontSize: 12, color: Colors.grey),
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
                                    "${recipe.serving} Serving",
                                    style: const TextStyle(
                                        fontSize: 12, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ).toList(),
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

Future<List<Recipe>> fetchAllRecipe() async {
  String data = await rootBundle.loadString("assets/json/all.json");
  var jsonResult = json.decode(data);

  List<Recipe> recipes = [];

  for (var recipe in jsonResult) {
    recipes.add(Recipe.fromJson(recipe));
  }
  return recipes;
}
