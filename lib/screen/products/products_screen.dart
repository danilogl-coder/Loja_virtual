import 'package:flutter/material.dart';
import 'package:loja_virtual/commom_components/custom_drawer/custom_drawer.dart';
import 'package:loja_virtual/models/product_manager.dart';
import 'package:loja_virtual/screen/products/components/product_list_tile.dart';
import 'package:loja_virtual/screen/products/components/search_dialog.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const Text('Produtos'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                showDialog(context: context, builder: (_) => SearchDialog());
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: Consumer<ProductManager>(
        builder: (context, productManager, child) => ListView.builder(
            padding: const EdgeInsets.all(4.0),
            itemCount: productManager.allProducts.length,
            itemBuilder: (context, index) =>
                ProductListTile(product: productManager.allProducts[index])),
      ),
    );
  }
}
