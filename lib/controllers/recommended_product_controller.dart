import 'package:food_app_part1/data/repository/popular_product_repo.dart';
import 'package:food_app_part1/modal/products_modal.dart';
import 'package:get/get.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductController recommendedProductRepo;

  RecommendedProductController(this.recommendedProductRepo, {required recommendedProductRepo},);

  List<ProductsModel> _recommendedProductList = [];
  List<ProductsModel> get recommendedProductList => _recommendedProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getRecommendedProductList() async {
    try {
      Response response = await recommendedProductRepo.getRecommendedProductList();
      if (response.statusCode == 200) {
        //print("got products");
        _recommendedProductList = [];
        _recommendedProductList
            .addAll(Product.fromJson(response.body).products as Iterable);
        //print(_popularProductList);
        _isLoaded = true;
        update();
      } else {
        // Handle error if needed
      }
    } catch (error) {
      // Handle exception if needed
    }
  }
}
