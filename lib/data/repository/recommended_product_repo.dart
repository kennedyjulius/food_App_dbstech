import 'package:food_app_part1/Utils/app_constants.dart';
import 'package:food_app_part1/data/api/api_client.dart';
import 'package:get/get.dart';

class RecommendedProductRepo extends GetxService {
  final Apiclient apiclient;
  RecommendedProductRepo({required this.apiclient});

  Future<Response> getRecommendedProductList() async {
    return await apiclient.getData(AppConstants.RECOMMENDED_PRODUCT_URI);
  }
}
