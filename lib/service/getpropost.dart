import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:storeapp/cubit/anas_cubit.dart';
import 'package:storeapp/helper/api.dart';
import 'package:storeapp/models/prod_model.dart';

class getpost {
  Future<Map<String, dynamic>> getpt(
      {required String title,
      required double price,
      required int id,
      required String description,
      required String image}) async {
    http.Response response = await api.put(
      url: 'https://fakestoreapi.com/products/$id',
      body: {
        "id": id.toString(),
        "title": title,
        "price": price.toString(),
        "description": description,
        "image": image,
        "category": "electronic"
      },
    );

    // print(response.body);
    Map<String, dynamic> data = await jsonDecode(response.body);
    print(data["title"]);

    return data;
  }
}
