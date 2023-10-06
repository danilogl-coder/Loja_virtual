import 'package:flutter/material.dart';
import 'package:loja_virtual/models/cart_manager.dart';
import 'package:provider/provider.dart';

class PriceCard extends StatelessWidget {
  const PriceCard({super.key, required this.buttonText, required this.onPressed});

  final String buttonText;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final cartManager = context.watch<CartManager>();
    final productsPrice = cartManager.productsPrice;
    return  Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Padding(padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('Resumo do Pedido', textAlign: TextAlign.start,style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0),),
         const SizedBox(height: 12),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Subtotal'),
              Text('R\$ ${productsPrice.toStringAsFixed(2)}'),
            ],
          ),
          const Divider(),
          const SizedBox(height: 12.0,),
          Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Total', style: TextStyle(fontWeight: FontWeight.w600),),
              Text('R\$ ${productsPrice.toStringAsFixed(2)}', style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 16.0),)
            ],
          ),
          const SizedBox(height: 8.0,),
         ElevatedButton(
          onPressed: onPressed, style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Theme.of(context).primaryColor)), child:  Text(buttonText, style: const TextStyle(color: Colors.white),)) 
        ],
      ) ,),
    );
  }
}