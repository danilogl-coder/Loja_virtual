import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:loja_virtual/models/cart_model.dart';
import 'package:loja_virtual/models/product.dart';
import 'package:loja_virtual/models/user_manager.dart';
import 'package:loja_virtual/models/user_model.dart';

class CartManager extends ChangeNotifier {
  List<CartModel> items = [];

  UserModel? user = UserModel();

  num productsPrice = 0.0;

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
      e.increment();
    } catch (e) {
      final cartModel = CartModel.fromProduct(product);
      cartModel.addListener(_onItemUpdate);
      items.add(cartModel);
      user!.cartReference
          .add(cartModel.toCartItemMap())
          .then((doc) => cartModel.id = doc.id);
          _onItemUpdate();
    }
    notifyListeners();
  }

  void _onItemUpdate() {
    productsPrice = 0.0;
    for (int i = 0; i < items.length; i++) {
      final cartModel = items[i];
      if (cartModel.quantity == 0) {
        removeOfCart(cartModel);
        i--;
        continue;
      }
      productsPrice += cartModel.totalPrice;
      _updateCartProduct(cartModel);
      
    }
    notifyListeners();
  }

  void removeOfCart(CartModel cartModel) {
    items.removeWhere((p) => p.id == cartModel.id);
    user!.cartReference.doc(cartModel.id).delete();
    cartModel.removeListener(_onItemUpdate);
    notifyListeners();
  }

  Future<void> _updateCartProduct(CartModel cartModel) async {
    final cartReference = user!.cartReference.doc(cartModel.id);
    final cartDoc = await cartReference.get();

    if (cartDoc.exists) {
      user!.cartReference.doc(cartModel.id).update(cartModel.toCartItemMap());
    }
  }

  bool get isCartValid 
  {
    for(final cartModel in items)
    {
      if(!cartModel.hasStock)
      {
        return false;
      }
    }
     return true;
  }
}
