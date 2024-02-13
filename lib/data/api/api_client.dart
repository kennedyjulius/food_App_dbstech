import 'dart:ui';

import 'package:food_app_part1/Utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/list_notifier.dart';

class Apiclient extends GetConnect implements GetxController {
  late String token;
  final String appBaseUrl;

  late Map<String, String> _mainHeaders;

  Apiclient({required this.appBaseUrl, required String token}) {
    baseUrl = appBaseUrl;
    timeout = Duration(seconds: 30);
    token = AppConstants.TOKEN;
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }
  //method to get data from the server
 Future<Response> getData(String uri,) async {
    try{
      Response response=await get(uri);
      return response;
    }catch(e){
      return Response(statusCode: 1,statusText: e.toString());
    }
  }

  Future<Response> postData(String uri, dynamic body)async{
    print(body.toString());
    try{
     Response response= await post(uri, body, headers: _mainHeaders);
     print(response.toString());
     return response;
    }catch(e){
      print(e.toString());
      return Response(statusCode: 1,statusText: e.toString());
    }
  }
  
  @override
  Disposer addListener(GetStateUpdate listener) {
    // TODO: implement addListener
    throw UnimplementedError();
  }
  
  @override
  Disposer addListenerId(Object? key, GetStateUpdate listener) {
    // TODO: implement addListenerId
    throw UnimplementedError();
  }
  
  @override
  void disposeId(Object id) {
    // TODO: implement disposeId
  }
  
  @override
  // TODO: implement hasListeners
  bool get hasListeners => throw UnimplementedError();
  
  @override
  // TODO: implement listeners
  int get listeners => throw UnimplementedError();
  
  @override
  void notifyChildrens() {
    // TODO: implement notifyChildrens
  }
  
  @override
  void refresh() {
    // TODO: implement refresh
  }
  
  @override
  void refreshGroup(Object id) {
    // TODO: implement refreshGroup
  }
  
  @override
  void removeListener(VoidCallback listener) {
    // TODO: implement removeListener
  }
  
  @override
  void removeListenerId(Object id, VoidCallback listener) {
    // TODO: implement removeListenerId
  }
  
  @override
  void update([List<Object>? ids, bool condition = true]) {
    // TODO: implement update
  }
}
