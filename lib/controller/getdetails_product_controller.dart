import 'dart:developer';

import 'package:shopping_app_ufs/model/product_model.dart';
import 'package:http/http.dart' as http;

class GetdetailsProductController {
  static Future<ProductModel?> getDeatilsProducts(String id) async {
    var res =
        await http.get(Uri.parse("https://fakestoreapi.com/products/$id"));

    if (res.statusCode == 200) {
      try {
        return productDetailsModelFromJson(res.body);
      } catch (e) {
        log(e.toString());
      }
    }
    return null;
  }
}
