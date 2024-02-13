import 'package:food_app_part1/pages/Home/main_food_page.dart';
import 'package:food_app_part1/pages/food/popular_food_detail.dart';
import 'package:food_app_part1/pages/food/recommended_food_detail.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class RouteHelper {
  static const String initial = '/';
  static const String popularFood = '/popular-food';
  static const String recommendedFood = '/recommended-food';

  static String getPopularFood(int pageId) => '$popularFood?pageId=$pageId';
  static String getInitial() => '$initial';
  static String getRecommendedFood(int pageId, String s) =>
      '$recommendedFood?pageId=$pageId'; // Add pageId parameter

  static List<GetPage> routes = [
    GetPage(
      name: initial,
      page: () => MainFoodPage(),
    ),
    GetPage(
      name: popularFood,
      page: () {
        var pageId = int.tryParse(Get.parameters['pageId'] ?? '');
        return PopularFoodDetail(pageId: pageId ?? 0);
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: recommendedFood,
      page: () {
        var pageId = int.tryParse(Get.parameters['pageId'] ?? '');
        return RecommendedFoodDetail(pageId: pageId ?? 0);
      },
      transition: Transition.fadeIn,
    ),
  ];
}
