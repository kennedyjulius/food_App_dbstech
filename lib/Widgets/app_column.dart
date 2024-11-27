import 'package:flutter/material.dart';
import 'package:food_app_part1/Utils/Colors.dart';
import 'package:food_app_part1/Utils/dimensions.dart';
import 'package:food_app_part1/Widgets/big_text.dart';
import 'package:food_app_part1/Widgets/icon_and_text_widget.dart';
import 'package:food_app_part1/Widgets/small_text.dart';

class AppColumn extends StatelessWidget {
  final String text;

  const AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BigText(text: text),
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
                        size: Dimensions.iconSize16,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: Dimensions.width15),
              const SmallText(text: "4.5", color: Colors.black38),
              SizedBox(width: Dimensions.width15),
              const SmallText(text: "1287", color: Colors.black38),
              SizedBox(width: Dimensions.width15),
              const SmallText(text: "Comments", color: Colors.black38),
            ],
          ),
          SizedBox(height: Dimensions.height10),
          Row(
            children: [
              IconAndTextWidget(
                icon: Icons.circle_sharp,
                text: "Normal",
                iconColor: AppColors.iconColor1,
              ),
              const SizedBox(width: 20),
              IconAndTextWidget(
                icon: Icons.location_on,
                text: "1.7 km",
                iconColor: AppColors.mainColor,
              ),
              const SizedBox(width: 20),
              IconAndTextWidget(
                icon: Icons.access_time_rounded,
                text: "32 min",
                iconColor: AppColors.iconColor2,
              ),
            ],
          )
        ],
      ),
    );
  }
}
