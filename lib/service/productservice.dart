import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecomm/model/productmodel.dart';

class ProductService {
  Dio dio = Dio();
  var url = "http://10.0.2.2:3000/api/users/products";

  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await dio.get(url);
      log('Response: $response');

      if (response.statusCode == 200) {
        log("${response.statusCode}");
        final jsonData = response.data;
        final List<dynamic> allProducts = jsonData['datas'];
        return allProducts
            .map(
              (product) => ProductModel.fromjson(product),
            )
            .toList();
      } else {
        log(
          'Failed to load. Status code: ${response.statusCode}',
        );
        throw Exception('Failed to load');
      }
    } catch (e) {
      log('Error in ApiService: $e');
      rethrow;
    }
  }
}
