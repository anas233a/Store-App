import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:storeapp/models/prod_model.dart';

class GetAllprod {
  static Future<List<prMod>> getAllprodu() async {
    http.Response response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));

    List<dynamic> data = jsonDecode(response.body);
    // double? id;
    // id = data[0]['price'];
    // print(id);
    List<prMod> prlist = [];
    for (int i = 0; i < data.length; i++) {
      prlist.add(prMod.get(data[i]));
    }

    return prlist;
  }
}
