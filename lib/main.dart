import 'package:flutter/material.dart';
import 'package:food_app_part1/pages/Home/main_food_page.dart';
import 'package:food_app_part1/pages/food/popular_food_detail.dart';
import 'package:food_app_part1/pages/food/recommended_food_detail.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: RecommendedFoodDetail(),
      );
    
  }
}
