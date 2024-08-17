import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:storeapp/models/prod_model.dart';

class api {
  static Future<http.Response> get2({required url}) async {
    http.Response response = await http.get(Uri.parse(url));
    return response;
  }

  static Future<dynamic> put(
      {required String url, @required dynamic body}) async {
    // Map<String, String> heder = {};
    // if (token != null) {
    //   heder.addAll({'token': '$token'});
    // }

    http.Response response = await http.put(Uri.parse(url), body: body);
    if (response.statusCode == 200) {
      return response;
    } else
      print("Errrrrrrrrr");
    return null;
  }
}
