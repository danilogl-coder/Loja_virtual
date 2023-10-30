import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:loja_virtual/models/product.dart';

class ProductManager extends ChangeNotifier {
  ProductManager() {
    _loadAllProducts();
  }

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  List<Product> allProducts = [];

  String? _search = '';
  String get search => _search!;

  set search(String value) {
    _search = value;
    notifyListeners();
  }

  List<Product> get filteredProducts {
    final List<Product> filteredProduct = [];
    if (search.isEmpty) {
      filteredProduct.addAll(allProducts);
    } else {
      filteredProduct.addAll(allProducts
          .where((p) => p.name!.toLowerCase().contains(search.toLowerCase())));
    }
    return filteredProduct;
  }

  Future<void> _loadAllProducts() async {
    final QuerySnapshot snapProducts =
        await firestore.collection('products').get();

    allProducts =
        snapProducts.docs.map((e) => Product.fromDocument(e)).toList();

    notifyListeners();
  }
  Product? findProductById(String? id)
  {
    try {
    return allProducts.firstWhere((p) => p.id == id );
    } catch (e) {
    return null;
    }
    
  }
}
