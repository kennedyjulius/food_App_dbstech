import 'package:food_app_part1/Utils/app_constants.dart';
import 'package:food_app_part1/controllers/recommended_product_controller.dart';
import 'package:food_app_part1/data/api/api_client.dart';
import 'package:food_app_part1/data/repository/popular_product_repo.dart';
import 'package:food_app_part1/data/repository/recommended_product_repo.dart';
import 'package:get/get.dart';

Future<void> init() async {
  // API client
  Get.lazyPut(() => Apiclient(
        appBaseUrl: AppConstants.BASE_URL, token: '',
      ));

  // Repositories
  Get.lazyPut(() => PopularProductRepo(apiclient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiclient: Get.find()));

  // Controllers
  // Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find<PopularProductRepo>()));
   Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find()));
}
