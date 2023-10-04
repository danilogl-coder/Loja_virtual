import 'package:flutter/material.dart';
import 'package:loja_virtual/commom_components/custom_drawer/custom_icom_buttom.dart';
import 'package:loja_virtual/models/cart_model.dart';

class CartTile extends StatelessWidget {
  const CartTile({super.key, required this.cartModel});

  final CartModel cartModel;
  @override
  Widget build(BuildContext context) {
    return Card(
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
              Text(
                'R\$ ${cartModel.unitPrice.toStringAsFixed(2)}',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              )
            ]),
          )),
          Column(children: [
            CustomIconButton(iconData: Icons.add, color: Theme.of(context).primaryColor, onTap: (){
              cartModel.increment;
            }),
            Text('${cartModel.quantity}',style: const TextStyle(fontSize: 20),),
            CustomIconButton(iconData: Icons.remove, color: Theme.of(context).primaryColor, onTap: (){
              cartModel.decrement;
            })
          ],)
        ]),
      ),
    );
  }
}
