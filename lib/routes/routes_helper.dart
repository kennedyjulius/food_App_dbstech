import 'package:food_app_part1/pages/Home/main_food_page.dart';
import 'package:food_app_part1/pages/food/popular_food_detail.dart';
import 'package:food_app_part1/pages/food/recommended_food_detail.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class RouteHelper {
  static const String initial = '/';
  static const String popularFood = '/popular-food';
  static const String recommendedFood =
      '/recommended-food'; // Define recommendedFood route

  static String getPopularFood(int pageId) => '$popularFood?pageId=$pageId';
  static String getInitial() => '$initial';
  static String getRecommendedFood() => '$recommendedFood';

  static List<GetPage> routes = [
    GetPage(
      name: initial,
      page: () => MainFoodPage(),
    ),
    GetPage(
      name: popularFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        return PopularFoodDetail(pageId);
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: recommendedFood, // Use recommendedFood constant here
      page: () => RecommendedFoodDetail(),
      transition: Transition.fadeIn,
    ),
  ];
}
