import 'package:flutter/material.dart';
import '../models/cart_item.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;

  CartItemWidget({required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(cartItem.product.imageUrl),
      title: Text(cartItem.product.title),
      trailing: Text('x${cartItem.quantity}'),
    );
  }
}
