import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:loja_virtual/models/product.dart';
import 'package:loja_virtual/models/user_manager.dart';
import 'package:loja_virtual/screen/products/components/size_widget.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key, required this.product});

  final Product product;
  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return ChangeNotifierProvider.value(
      value: product,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(product.name!),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            FlutterCarousel(
              options: CarouselOptions(
                height: 400.0,
                showIndicator: true,
                slideIndicator: const CircularSlideIndicator(),
              ),
              items: product.images!.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(color: Colors.white),
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Image.network(i));
                  },
                );
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      product.name!,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    const Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Text(
                          'A partir de',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w600),
                        )),
                  ]),
            ),
            Text(
              'R\$ 19,99',
              style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: primaryColor),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16.0, bottom: 8.0),
              child: Text(
                'Descrição',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              product.description!,
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16.0, bottom: 8.0),
              child: Text('Tamanhos',
                  style:
                      TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500)),
            ),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: product.sizes!.map((s) {
                return SizeWidget(
                  size: s,
                );
              }).toList(),
            ),
            const SizedBox(
              height: 20,
            ),
            if (product.hasStock)
              Consumer2<UserManager, Product>(
                builder: (_, userManager, product, __) {
                  return SizedBox(
                    height: 44,
                    child: ElevatedButton(
                      onPressed: product.selectedSize != null
                          ? () {
                              if (userManager.isLogedIn) {
                                //TODO: ADICIONAR AO CARRINHO
                              } else {
                                Navigator.of(context).pushNamed('/login');
                              }
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor),
                      child: Text(
                        userManager.isLogedIn
                            ? 'Adicionar ao carrinho'
                            : 'Entre para comprar',
                        style: const TextStyle(
                            color: Colors.white, fontSize: 18.0),
                      ),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
