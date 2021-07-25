import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foocarie/constants.dart';
import 'package:foocarie/screens/detail_recipe_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List freshList = [
    {"image": "assets/images/asparagus.png", "name": "Asian Glazed Asparagus"},
    {
      "image": "assets/images/chicken_fried_rice.png",
      "name": "Chicken Amazing Fried Rice"
    },
    {
      "image": "assets/images/filete_con_papas_cambray.png",
      "name": "Con Papas Cambray Spicy"
    },
    {
      "image": "assets/images/pasta_bolognese.png",
      "name": "Pasta Bolognese Sweet Creamy"
    },
    {"image": "assets/images/steak_bacon.png", "name": "Steak Bacon Smoke"}
  ];

  List recommendedList = [
    {"image": "assets/images/asparagus.png", "name": "Asian Glazed Asparagus"},
    {
      "image": "assets/images/chicken_fried_rice.png",
      "name": "Chicken Amazing Fried Rice"
    },
    {
      "image": "assets/images/filete_con_papas_cambray.png",
      "name": "Con Papas Cambray Spicy"
    },
    {
      "image": "assets/images/pasta_bolognese.png",
      "name": "Pasta Bolognese Sweet Creamy"
    },
    {"image": "assets/images/steak_bacon.png", "name": "Steak Bacon Smoke"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightColor,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 64, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => print("Menu"),
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
              SizedBox(height: 16),
              Text(
                "Bonjor Emma",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 12),
              Text(
                "What would you like to cook today?",
                style: TextStyle(
                  fontSize: 28.0,
                  fontFamily: "HellixBold",
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 6,
                        horizontal: 8,
                      ),
                      decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(14)),
                      child: TextField(
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
                  SizedBox(width: 16),
                  GestureDetector(
                    onTap: () => print("settings"),
                    child: Container(
                      padding: EdgeInsets.symmetric(
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
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Todays Fresh Recipe",
                    style: TextStyle(fontSize: 22, fontFamily: "HellixBold"),
                  ),
                  GestureDetector(
                    onTap: () => print("see all"),
                    child: Text(
                      "See All",
                      style: TextStyle(
                          fontSize: 18,
                          color: kOrangeColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Container(
                height: 240,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: freshList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailRecipe())),
                      child: Container(
                        margin: EdgeInsets.only(right: 32),
                        height: 240,
                        width: 200,
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
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
                              child: Image.asset(
                                freshList[index]["image"],
                                height: 100,
                              ),
                            ),
                            Positioned(
                              top: 110,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Breakfast",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: kBlueColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Container(
                                      width: 180,
                                      child: Text(
                                        freshList[index]["name"],
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: "HellixBold",
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Row(
                                      children: List.generate(
                                        5,
                                        (index) => Icon(
                                          Icons.star,
                                          color: kOrangeColor,
                                          size: 16,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 6),
                                    Text(
                                      "120 Calories",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: kOrangeColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Row(
                                          children: [
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
                                        SizedBox(width: 16),
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              "assets/icons/bell.svg",
                                              height: 14,
                                              color: Colors.grey,
                                            ),
                                            SizedBox(width: 8),
                                            Text(
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
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recommended",
                    style: TextStyle(fontSize: 22, fontFamily: "HellixBold"),
                  ),
                  GestureDetector(
                    onTap: () => print("see recommended"),
                    child: Text(
                      "See All",
                      style: TextStyle(
                          fontSize: 18,
                          color: kOrangeColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: recommendedList.length,
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailRecipe())),
                    child: Container(
                      height: 120,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 12,
                      ),
                      margin: EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            recommendedList[index]["image"],
                            height: 180,
                            width: 120,
                            fit: BoxFit.contain,
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Breakfast",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: kBlueColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 6),
                                  Text(
                                    recommendedList[index]["name"],
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: "HellixBold",
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Row(
                                        children: List.generate(
                                          5,
                                          (index) => Icon(
                                            Icons.star,
                                            color: kOrangeColor,
                                            size: 16,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 6),
                                      Text(
                                        "120 Calories",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: kOrangeColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 6),
                                  Row(
                                    children: [
                                      Row(
                                        children: [
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
                                      SizedBox(width: 16),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            "assets/icons/bell.svg",
                                            height: 14,
                                            color: Colors.grey,
                                          ),
                                          SizedBox(width: 8),
                                          Text(
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
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              height: 28,
                              width: 36,
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.favorite_border,
                                  color: Colors.grey,
                                ),
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
    );
  }
}
