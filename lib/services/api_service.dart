import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:katalog_app/model/product_model.dart';

class ApiService {
  Future<ProductModel> fetchProducts() async {
    final response = await http.get(
      Uri.parse("https://wantapi.com/products.php"),

    );
    if( response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return ProductModel.fromJson(data);
    }else{
      throw Exception("failed to load products.");
    }
  }
}