import 'package:flutter/material.dart';
import 'package:loja_virtual/models/product_manager.dart';
import 'package:loja_virtual/models/section_item.dart';
import 'package:provider/provider.dart';

class ItemTile extends StatelessWidget {
  const ItemTile({super.key, required this.item});

  final SectionItem item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
      if(item.product != null )
      {
        final product = context.read<ProductManager>().findProductById(item.product);
        if(product != null)
        {
        Navigator.of(context).pushNamed('/product', arguments: product);
        }
      }
      },
      child: AspectRatio(
                        aspectRatio: 1,
                        child: Image.network(
                          item.image ?? '',
                          fit: BoxFit.cover,
                        )),
    );
  }
}