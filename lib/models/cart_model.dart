import 'package:loja_virtual/models/item_size.dart';
import 'package:loja_virtual/models/product.dart';

class CartModel {
  CartModel.fromProduct(this.product) {
    productId = product!.id!;
    quantity = 1;
    size = product!.selectedSize.name!;
  }

  String? productId;
  int? quantity;
  String? size;

  Product? product;

  ItemSize? get itemSize {
    if (product == null) {
      return null;
    } else {
      return product!.findSize(size!);
    }
  }

  num get unitPrice {
    if (product == null) {
      return 0;
    } else {
      return itemSize?.price ?? 0;
    }
  }
}
