import 'package:food_app_part1/data/api/api_client.dart';
import 'package:get/get.dart';

class PopularProductRepo extends GetxService {
  final Apiclient apiclient;
  PopularProductRepo({required this.apiclient});

  Future<Response> getPopularProductList() async {
    return await apiclient.getData("https://www.dbestech.com/api/product/list");
  }
}
