import 'package:flutter/material.dart';
import 'package:loja_virtual/commom_components/custom_drawer/custom_icom_buttom.dart';
import 'package:loja_virtual/models/cart_model.dart';
import 'package:provider/provider.dart';

class CartTile extends StatelessWidget {
  const CartTile({super.key, required this.cartModel});

  final CartModel cartModel;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: cartModel,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Row(children: [
            SizedBox(
              height: 80.0,
              width: 80.0,
              child: Image.network(cartModel.product!.images!.first),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cartModel.product!.name!,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 17.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'Tamanho: ${cartModel.size}',
                        style: const TextStyle(fontWeight: FontWeight.w300),
                      ),
                    ),
                    Consumer<CartModel>(
                      builder: (context, cartModel, child) {
                        if (cartModel.hasStock) {
                          return Text(
                            'R\$ ${cartModel.unitPrice.toStringAsFixed(2)}',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold),
                          );
                        } else 
                        {
                          return const Text('Sem estoque suficiente', style: TextStyle(color: Colors.red, fontSize: 12),);
                        }
                      },
                    )
                  ]),
            )),
            Consumer<CartModel>(
              builder: (_, cartModels, __) => Column(
                children: [
                  CustomIconButton(
                      iconData: Icons.add,
                      color: Theme.of(context).primaryColor,
                      onTap: () {
                        cartModels.increment();
                      }),
                  Text(
                    '${cartModels.quantity}',
                    style: const TextStyle(fontSize: 20),
                  ),
                  CustomIconButton(
                      iconData: Icons.remove,
                      color: cartModels.quantity > 1
                          ? Theme.of(context).primaryColor
                          : Colors.red,
                      onTap: () {
                        cartModels.decrement();
                      })
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
