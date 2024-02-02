import 'package:food_app_part1/Utils/app_constants.dart';
import 'package:food_app_part1/data/api/api_client.dart';
import 'package:get/get.dart';

class PopularProductRepo extends GetxService {
  final Apiclient apiclient;
  PopularProductRepo({required this.apiclient});

  Future<Response> getPopularProductList() async {
    return await apiclient.getData(AppConstants.POPULAR_PRODUCT_URI);
  }
}
