import 'package:flutter/material.dart';
import 'package:food_app_part1/Utils/app_constants.dart';
import 'package:food_app_part1/controllers/cart_controller.dart';
import 'package:food_app_part1/controllers/popular_product_controller.dart';
import 'package:food_app_part1/controllers/recommended_product_controller.dart';
import 'package:food_app_part1/data/api/api_client.dart';
import 'package:food_app_part1/data/repository/popular_product_repo.dart';
import 'package:food_app_part1/data/repository/recommended_product_repo.dart';
import 'package:food_app_part1/pages/Home/main_food_page.dart';
import 'package:food_app_part1/pages/cart/cart_page.dart';
import 'package:food_app_part1/pages/food/recommended_food_detail.dart';
import 'package:food_app_part1/routes/routes_helper.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'helpers/dependecies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  get apiclient =>
      Apiclient(appBaseUrl: AppConstants.BASE_URL, token: AppConstants.TOKEN);

  @override
  Widget build(BuildContext context) {
    // Initialize controllers only if they are not already initialized
    if (!Get.isRegistered<PopularProductController>()) {
      Get.put(PopularProductController(
          popularProductRepo: PopularProductRepo(apiclient: apiclient)));
    }

    if (!Get.isRegistered<RecommendedProductController>()) {
      Get.put(RecommendedProductController(
          recommendedProductRepo:
              RecommendedProductRepo(apiclient: apiclient)));
    }

    // Ensure controllers are fully initialized before moving forward
    if (Get.isRegistered<PopularProductController>() &&
        Get.isRegistered<RecommendedProductController>()) {
      // Retrieve data using the controllers
      Get.find<PopularProductController>().getPopularProductList();
      Get.find<RecommendedProductController>().getRecommendedProductList();
      Get.find<CartController>();
    } else {
      // Handle the case where controllers are not initialized
      print("Error: Controllers not initialized properly.");
    }

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: RecommendedFoodDetail(pageId: 1,),
      // initialRoute: RouteHelper.initial,
      // home: MainFoodPage(),
      // getPages: RouteHelper.routes,
    );
  }
}
