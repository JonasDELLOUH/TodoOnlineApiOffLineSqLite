import 'dart:convert';

import 'package:dio/dio.dart' as Dio ;
import 'package:get/get_connect/connect.dart';
import 'package:todo_cours/core/functions.dart';

class BaseService extends GetConnect{

  Future<dynamic> getFromApi(url, {Map<String, dynamic>? parameters, bool haveToken = false}) async {
    print("get request : " + url);
    print(parameters.toString());
    try {
      Dio.Dio dio = new Dio.Dio();
      if(haveToken){
        String token = await getSharedPrefReturn("token");
        print("voici le token : $token");
        dio.options.headers["authorization"] = "Bearer $token";
      }
      var response = await dio.get(url, queryParameters: parameters);
      var apiResponse = response.data;
      print("api get response : $apiResponse");
      return {"result": apiResponse};
    } on Dio.DioError catch (e) {
      var json = e.response.toString();
      print("post response error : ${e.response}");
      print(jsonDecode(json));
      return {
        "result": null,
        "error": jsonDecode(json) == null
            ? " "
            : jsonDecode(json)['message'].toString()
      };
    }
  }

  Future<dynamic> patchFromApi({required String url, bool haveToken = false, String id = "", required Map<String,  dynamic> map}) async {
    print("post request : " + url);
    print(map.toString());
    try{
      Dio.FormData data = Dio.FormData.fromMap(map);
      Dio.Dio dio = Dio.Dio();
      if(haveToken){
        String token = await getSharedPrefReturn("token");
        print("voici le token : $token");
        dio.options.headers["Authorization"] = "Bearer $token";
      }
      print("the data : ${data.fields}");
      var response = await dio.patch(url+id, data: map);
      var apiResponse = response.data;
      print("post response : $apiResponse");
      return {"result": apiResponse};
    } on Dio.DioError catch (e) {
      var json = e.response.toString();
      print("post response error : ${e.response}");
      // errorFormSnackBar(map, jsonDecode(json), e.response?.statusCode);
      print(jsonDecode(json));
      return {
        "result": null,
        "error": jsonDecode(json) == null
            ? " "
            : jsonDecode(json)['message'].toString()
      };
    }
  }

  Future<dynamic> postFromApi(url, map, {bool haveToken = false}) async {
    print("post request : " + url);
    print(map.toString());
    try {
      Dio.FormData data = Dio.FormData.fromMap(map);
      Dio.Dio dio = Dio.Dio();
      if(haveToken){
        String token = await getSharedPrefReturn("token");
        print("voici le token : $token");
        dio.options.headers["Authorization"] = "Bearer $token";
      }
      print("the data : ${data.fields}");
      var response = await dio.post(url, data: map);
      var apiResponse = response.data;
      print("post response : $apiResponse");
      return {"result": apiResponse};
    } on Dio.DioError catch (e) {
      var json = e.response.toString();
      print("post response error : ${e.response}");
      // errorFormSnackBar(map, jsonDecode(json), e.response?.statusCode);
      print(jsonDecode(json));
      return {
        "result": null,
        "error": jsonDecode(json) == null
            ? " "
            : jsonDecode(json)['message'].toString()
      };
    }
  }
}