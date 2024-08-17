import 'dart:convert';

import 'package:storeapp/helper/api.dart';
import 'package:storeapp/models/prod_model.dart';
import 'package:http/http.dart' as http;

class Catname {
  String? category_name;
  Future<List<prMod>> getcatname({required category_name}) async {
    http.Response response = await api.get2(
        url: 'https://fakestoreapi.com/products/category/$category_name?');

    List<prMod> data = jsonDecode(response.body);

    List<prMod> pr = [];
    for (int i = 0; i < pr.length; i++) {
      pr.add(prMod.get(data[i]));
    }
    return data;
  }
}
