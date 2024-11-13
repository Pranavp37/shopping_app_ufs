import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:shopping_app_ufs/controller/getall_products_controller.dart';

class DelectProductController {
  delect(String id) async {
    var res =
        await http.delete(Uri.parse("https://fakestoreapi.com/products/$id"));
    try {
      if (res.statusCode == 200) {
        await GetallProductsController.getAllProducts();
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
