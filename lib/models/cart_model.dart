import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/models/item_size.dart';
import 'package:loja_virtual/models/product.dart';

class CartModel extends ChangeNotifier {
  CartModel.fromProduct(this.product) {
    productId = product!.id!;
    quantity = 1;
    size = product!.selectedSize.name!;
  }

  CartModel.fromDocument(DocumentSnapshot document) {
    id = document.id;
    productId = document.get('pid') as String;
    quantity = document.get('quantity') as int;
    size = document.get('size') as String;

    firestore
        .doc('products/$productId')
        .get()
        .then((doc) => product = Product.fromDocument(doc));
  }

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  String? id;
  String? productId;
  late int quantity;
  String? size;

  Product? product;

  ItemSize? get itemSize {
    if (product == null) {
      return null;
    } else {
      return product!.findSize(size!);
    }
  }

  num get unitPrice {
    if (product == null) {
      return 0;
    } else {
      return itemSize?.price ?? 0;
    }
  }

  Map<String, dynamic> toCartItemMap() {
    return {
      'pid': productId,
      'quantity': quantity,
      'size': size,
    };
  }

  bool stackable(Product product) {
    return product.id == productId && product.selectedSize.name == size;
  }

  void increment() {
    quantity++;
    notifyListeners();
  }

  void decrement() {
    quantity--;
    notifyListeners();
  }
}
