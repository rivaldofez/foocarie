import 'package:flutter/material.dart';
import 'package:foocarie/constants.dart';

class DetailRecipe extends StatefulWidget {
  final String name;
  final String image;

  DetailRecipe(this.name, this.image);

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
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
            top: 64,
            left: 28,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 28),
                  decoration: BoxDecoration(
                    color: kOrangeColor,
                    borderRadius: BorderRadius.circular(
                      8,
                    ),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.star,
                      color: kLightColor,
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.5,
                child: Text(
                  widget.name,
                  style: TextStyle(fontSize: 36, fontFamily: "HellixBold"),
                ),
              ),
              SizedBox(height: 24),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "\$",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: "HellixBold",
                        color: kOrangeColor,
                      ),
                    ),
                    TextSpan(
                      text: " 250.5",
                      style: TextStyle(
                        fontSize: 36,
                        fontFamily: "HellixBold",
                        color: kOrangeColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
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
                            "120 Calories",
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
                            "10 mins",
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
                            "1 serving",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: "HellixBold",
                            ),
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      widget.image,
                      height: 250,
                      width: 400,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Text(
                "Description",
                style: TextStyle(fontSize: 24, fontFamily: "HellixBold"),
              ),
              SizedBox(height: 8),
              Padding(
                padding: EdgeInsets.only(right: 28, bottom: 28),
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eu vehicula justo. In eget finibus neque. Sed facilisis quam vitae libero placerat, et consequat nulla dignissim. Praesent felis nisl, molestie quis tempus eu, dictum non orci. In hac habitasse platea dictumst. Nam ex quam, ultrices sit amet tincidunt sed, tincidunt eget felis. In vehicula venenatis velit eget lobortis. Pellentesque sed varius velit. Nam non mattis est, at eleifend lectus. Curabitur eget pretium mi. Proin et varius lectus. Pellentesque tincidunt auctor ultricies. Integer at maximus est, quis sodales diam. Suspendisse sit amet ex vel lorem sodales consequat vel quis ipsum. In dapibus malesuada ultrices. Maecenas sollicitudin risus nulla. Aenean molestie felis tristique ullamcorper bibendum. Aenean tincidunt nunc ante, nec placerat turpis pellentesque non. Quisque non congue sem. Pellentesque ultrices lacinia mauris, ac lobortis ante placerat ac. Suspendisse pharetra pretium ornare. Maecenas et elit porta, sodales purus in, luctus ligula. Nulla sed nulla id nulla feugiat ullamcorper. Phasellus mollis aliquam sem sit amet feugiat. Quisque sit amet dapibus justo. Pellentesque molestie turpis at risus hendrerit porta. Fusce maximus fringilla ex vitae convallis.",
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
