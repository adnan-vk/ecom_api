import 'dart:developer';
import 'package:ecomm/model/productmodel.dart';
import 'package:ecomm/service/productservice.dart';
import 'package:flutter/material.dart';

class ProductController extends ChangeNotifier {
  List<ProductModel> booklist = [];
  ProductService bookservice = ProductService();

  Future<void> getProduct() async {
    try {
      booklist = await bookservice.getProducts();
      notifyListeners();
    } catch (e) {
      log('Error in BookProvider: $e');
    }
  }
}
