import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foocarie/constants.dart';
import 'package:foocarie/screens/detail_recipe_screen.dart';
import 'package:foocarie/screens/recipe_predictor.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool tag = false;
  List freshList = [
    {"image": "assets/images/01.png", "name": "Asian Glazed Asparagus"},
    {"image": "assets/images/02.png", "name": "Chicken Amazing Fried Rice"},
    {"image": "assets/images/03.png", "name": "Con Papas Cambray Spicy"},
    {"image": "assets/images/04.png", "name": "Pasta Bolognese Sweet Creamy"},
    {"image": "assets/images/05.png", "name": "Steak Bacon Smoke"}
  ];

  List recommendedList = [
    {"image": "assets/images/01.png", "name": "Asian Glazed Asparagus"},
    {"image": "assets/images/02.png", "name": "Chicken Amazing Fried Rice"},
    {"image": "assets/images/03.png", "name": "Con Papas Cambray Spicy"},
    {"image": "assets/images/04.png", "name": "Pasta Bolognese Sweet Creamy"},
    {"image": "assets/images/05.png", "name": "Steak Bacon Smoke"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightColor,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const RecipePredictorScreen(),
                      ),
                    ),
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
                "Bonjor Emma",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                "What would you like to cook today?",
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
                    "Todays Fresh Recipe",
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
                  itemCount: freshList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DetailRecipe(
                              index,
                              freshList[index]["name"],
                              freshList[index]["image"],
                              tag = true),
                        ),
                      ),
                      child: Container(
                        margin: const EdgeInsets.only(right: 32),
                        height: 240,
                        width: 200,
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            const Positioned(
                              top: 16,
                              left: 16,
                              child: Icon(
                                Icons.favorite_border,
                                color: Colors.grey,
                              ),
                            ),
                            Positioned(
                              top: 16,
                              right: -32,
                              child: Hero(
                                tag: "fresh$index",
                                child: Image.asset(
                                  freshList[index]["image"],
                                  height: 100,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 110,
                              child: Padding(
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
                                        freshList[index]["name"],
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
                itemCount: recommendedList.length,
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DetailRecipe(
                            index,
                            recommendedList[index]["name"],
                            recommendedList[index]["image"],
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
                              recommendedList[index]["image"],
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
                                    recommendedList[index]["name"],
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
