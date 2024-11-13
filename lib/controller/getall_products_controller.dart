import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:shopping_app_ufs/model/product_model.dart';

class GetallProductsController {
  static Future<List<ProductModel>?> getAllProducts() async {
    var res = await http.get(Uri.parse("https://fakestoreapi.com/products"));

    if (res.statusCode == 200) {
      try {
        return productModelFromJson(res.body);
      } catch (e) {
        log(e.toString());
      }
    }
    return null;
  }
}
