import 'package:get/get.dart';

class Apiclient extends GetConnect implements GetxController {
  late String token;
  final String appBaseUrl;

  late Map<String, String> _mainHeaders;

  Apiclient({required this.appBaseUrl, required this.token}) {
    baseUrl = appBaseUrl;
    timeout = Duration(seconds: 30);
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }
}
