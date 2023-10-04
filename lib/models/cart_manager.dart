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
    items = cartSnap.docs
        .map((d) => CartModel.fromDocument(d)..addListener(_onItemUpdate))
        .toList();
  }

  void addToCart(Product product) {
    try {
      final e = items.firstWhere((p) => p.stackable(product));
      e.quantity++;
    } catch (e) {
      final cartModel = CartModel.fromProduct(product);
      cartModel.addListener(_onItemUpdate);
      items.add(cartModel);
      user!.cartReference.add(cartModel.toCartItemMap());
    }
  }

  void _onItemUpdate() {
    print('atualizado');
  }
}
