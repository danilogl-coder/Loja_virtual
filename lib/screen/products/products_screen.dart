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
        title:
            Consumer<ProductManager>(builder: (context, productManager, child) {
          if (productManager.search.isEmpty) {
            return const Text('Produtos');
          } else {
            return LayoutBuilder(
              builder: (_, constraints) {
                return GestureDetector(
                  onTap: () async {
                    final search = await showDialog<String>(
                        context: context,
                        builder: (_) => SearchDialog(
                              initialText: productManager.search,
                            ));
                    if (search != null) {
                      productManager.search = search;
                    }
                  },
                  child: Container(
                      width: constraints.biggest.width,
                      child: Text(
                        productManager.search,
                        textAlign: TextAlign.center,
                      )),
                );
              },
            );
          }
        }),
        centerTitle: true,
        actions: [
          Consumer<ProductManager>(
            builder: (context, productManger, child) {
              if (productManger.search.isEmpty) {
                return IconButton(
                    onPressed: () async {
                      final search = await showDialog<String>(
                          context: context,
                          builder: (_) =>
                              SearchDialog(initialText: productManger.search));
                      if (search != null) {
                        productManger.search = search;
                      }
                    },
                    icon: const Icon(Icons.search));
              } else {
                return IconButton(
                    onPressed: () async {
                      productManger.search = "";
                    },
                    icon: const Icon(Icons.close));
              }
            },
          )
        ],
      ),
      body: Column(
        children: [
          Consumer<ProductManager>(builder: (context, productManager, child) {
            final filteredProducts = productManager.filteredProducts;
            return Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.all(4.0),
                  itemCount: filteredProducts.length,
                  itemBuilder: (context, index) =>
                      ProductListTile(product: filteredProducts[index])),
            );
          }),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/cart');
                },
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColor,
                child: Icon(Icons.shopping_cart),
              ),
            ),
          )
        ],
      ),
    );
  }
}
