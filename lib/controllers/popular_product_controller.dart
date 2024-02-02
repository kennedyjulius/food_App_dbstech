import 'package:food_app_part1/data/repository/popular_product_repo.dart';
import 'package:food_app_part1/modal/products_modal.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;

  Future<void> getPopularProductList() async {
    try {
      Response response = await popularProductRepo.getPopularProductList();
      if (response.statusCode == 200) {
        print("got products");
        _popularProductList = [];
        _popularProductList
            .addAll(Product.fromJson(response.body).products as Iterable);
        print(_popularProductList);
        update();
      } else {
        // Handle error if needed
      }
    } catch (error) {
      // Handle exception if needed
    }
  }
}
