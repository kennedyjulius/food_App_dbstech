// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';

import 'package:food_app_part1/data/repository/recommended_product_repo.dart';
import 'package:food_app_part1/modal/products_modal.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;

  RecommendedProductController({required this.recommendedProductRepo});

  List<ProductsModel> _recommendedProductList = [];
  List<ProductsModel> get recommendedProductList => _recommendedProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getRecommendedProductList() async {
    try {
      Response response =
          await recommendedProductRepo.getRecommendedProductList();
      if (response.statusCode == 200) {
        _recommendedProductList = [];
        _recommendedProductList
            .addAll(Product.fromJson(response.body).products!);
        _isLoaded = true;
        update();
      } else {
        Get.snackbar("Error",
            "Could not get products recommended"); // Handle error if needed
      }
    } catch (error) {
      print(error.toString());
    }
  }
}
