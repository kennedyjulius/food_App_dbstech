import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_app_part1/Utils/Colors.dart';
import 'package:food_app_part1/Utils/dimensions.dart';
import 'package:food_app_part1/Widgets/big_text.dart';
import 'package:food_app_part1/Widgets/icon_and_text_widget.dart';
import 'package:food_app_part1/Widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.9);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: Dimensions.pageView,
          child: PageView.builder(
            controller: pageController,
            itemCount: 5,
            itemBuilder: (context, position) {
              return _buildPageItem(position);
            },
          ),
        ),
      DotsIndicator(
  dotsCount: 5,
  position: _currPageValue.toInt(),
  decorator: DotsDecorator(
    color: Colors.black87, // Inactive color
    activeColor: AppColors.mainColor,
  ),
),


      ],
    );
  }
  //transform api from flutter

Widget _buildPageItem(int index) {
  Matrix4 matrix = Matrix4.identity();
  var currTrans = _height / 2;

  if (index == _currPageValue.floor()) {
    var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
    currTrans = _height * (1 - currScale) / 2;
    matrix = Matrix4.diagonal3Values(1, currScale, 1)
      ..setTranslationRaw(0, currTrans, 0);
  } else if (index == _currPageValue.floor() + 1) {
    var currScale = _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
    currTrans = _height * (1 - currScale) / 2;
    matrix = Matrix4.diagonal3Values(1, currScale, 1)
      ..setTranslationRaw(0, currTrans, 0);
  } else if (index == _currPageValue.floor() - 1) {
    var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
    matrix = Matrix4.diagonal3Values(1, currScale, 1)
      ..setTranslationRaw(0, currTrans, 0);
  }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: 220,
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/chicken.jpg"),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 10.0,
                    offset: Offset(0, 5)
                  ),
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 10.0,
                    offset: Offset(-5, 0)
                  ),
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    //blurRadius: 10.0,
                    offset: Offset(5, 0)
                  ),
                ]
              ),
              child: Container(
                padding: EdgeInsets.only(top: Dimensions.height15, left: Dimensions.height15, right: 15),
                child: Column(
                  children: [
                    BigText(text: "Chinese Side"),
                    SizedBox(height: Dimensions.height10),
                    Row(
                      children: [
                        Container(
                          child: Wrap(
                            children: List.generate(
                              5,
                              (index) => Padding(
                                padding: const EdgeInsets.only(right: 4.0),
                                child: Icon(
                                  Icons.star,
                                  color: AppColors.mainColor,
                                  size: 15,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 15),
                        SmallText(text: "4.5", color: Colors.black38),
                        SizedBox(width: 15),
                        SmallText(text: "1287", color: Colors.black38),
                        SizedBox(width: 15),
                        SmallText(text: "Comments", color: Colors.black38),
                      ],
                    ),
                    SizedBox(height: Dimensions.height20),
                    Row(
                      children: [
                        IconAndWidget(
                          icon: Icons.circle_sharp,
                          text: "Normal",
                          iconColor: AppColors.iconColor1,
                        ),
                        SizedBox(width: 10),
                        IconAndWidget(
                          icon: Icons.location_on,
                          text: "1.7 km",
                          iconColor: AppColors.iconColor1,
                        ),
                        SizedBox(width: 10),
                        IconAndWidget(
                          icon: Icons.access_time_rounded,
                          text: "32 min",
                          iconColor: AppColors.iconColor1,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
