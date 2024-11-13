import 'package:http/http.dart' as http;
import 'package:shopping_app_ufs/model/product_model.dart';

class PostProdutsController {
  static postDatatoApi({required ProductModel postData}) async {
    var res =
        await http.post(Uri.parse('https://fakestoreapi.com/products'), body: {
      "title": postData.title,
      "price": postData.price,
      "description": postData.price,
      "category": postData.category,
    });

    if (res.statusCode == 200) {}
  }
}
