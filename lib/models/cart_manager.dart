import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loja_virtual/models/cart_model.dart';
import 'package:loja_virtual/models/product.dart';
import 'package:loja_virtual/models/user_manager.dart';
import 'package:loja_virtual/models/user_model.dart';

class CartManager {
  List<CartModel> items = [];

  UserModel? user = UserModel();

  void updateUser(UserManager userManager) {
    user = userManager.userModel;
    items.clear();
    if (user != null) {
      _loadCartItems();
    }
  }

  Future<void> _loadCartItems() async {
    final QuerySnapshot cartSnap = await user!.cartReference.get();
    items = cartSnap.docs.map((d) => CartModel.fromDocument(d)).toList();
  }

  void addToCart(Product product) {
    items.add(CartModel.fromProduct(product));
  }
}
