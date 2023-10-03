import 'package:flutter/material.dart';
import 'package:loja_virtual/models/cart_manager.dart';
import 'package:loja_virtual/screen/cart/components/cart_tile.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho'),
        centerTitle: true,
      ),
      body: Consumer<CartManager>(
        builder: (context, cartManager, child) {
          return Column(
            children: cartManager.items
                .map((cartProduct) => CartTile(cartModel: cartProduct))
                .toList(),
          );
        },
      ),
    );
  }
}
