import 'package:flutter/material.dart';
import 'package:food_app_part1/Utils/Colors.dart';
import 'package:food_app_part1/Widgets/small_text.dart';

class RecommendedFoodDetail extends StatefulWidget {
  const RecommendedFoodDetail({super.key});

  @override
  State<RecommendedFoodDetail> createState() => _RecommendedFoodDetailState();
}

class _RecommendedFoodDetailState extends State<RecommendedFoodDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: AppColors.yellowColor,
            pinned: true,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset("assets/food3.jpeg", width: double.maxFinite,fit: BoxFit.cover,
              ),
            ),
            bottom: PreferredSize(preferredSize: Size.fromHeight(0), child: Container(
              color: Colors.white,
              child: Text("Sliver App Bar"),
              width: double.maxFinite,
              padding: EdgeInsets.only(top: 5, bottom: 10),
            )
            ),
          ),
          SliverToBoxAdapter(
            child: SmallText(text: "Chicken "),
          )
        ],
      ),
    );
  }
}