import 'package:food_app_part1/pages/Home/main_food_page.dart';
import 'package:food_app_part1/pages/food/popular_food_detail.dart';
import 'package:food_app_part1/pages/food/recommended_food_detail.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class RouteHelper {
  static const String initial = '/';
  static const String popularFood = '/popular-food';

  static String getPopularFood() => '$popularFood';

  static List<GetPage> routes = [
    GetPage(
      name: "/",
      page: () => MainFoodPage(),
    ),

    GetPage(
      name: "popular-food",
      page: () => PopularFoodDetail(),
      transition: Transition.fadeIn
    ),

    GetPage(
      name: "recommended-food",
      page: () => RecommendedFoodDetail(),
      transition: Transition.fadeIn
    ),
    
  ];
}
