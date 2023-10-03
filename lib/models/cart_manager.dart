import 'package:loja_virtual/models/cart_model.dart';
import 'package:loja_virtual/models/product.dart';

class CartManager {
  List<CartModel> items = [];

  void addToCart(Product product) {
    items.add(CartModel.fromProduct(product));
  }
}
