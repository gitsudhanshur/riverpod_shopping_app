import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/cart_provider.dart';

class CartScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartProvider);
    final totalAmount = cartItems.fold<double>(
        0.0, (sum, item) => sum + (item.product.price * item.quantity));

    return Scaffold(
      appBar: AppBar(title: Text('Your Cart')),
      body: Column(
        children: [
          Expanded(
            child: cartItems.isEmpty
                ? Center(child: Text('Your cart is empty.'))
                : ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (ctx, i) {
                      final cartItem = cartItems[i];
                      return Dismissible(
                        key: ValueKey(cartItem.product.id),
                        background: Container(
                          color: Colors.red,
                          child: Icon(Icons.delete, color: Colors.white),
                        ),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) {
                          ref.read(cartProvider.notifier).removeProduct(cartItem.product);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('${cartItem.product.title} removed from cart')),
                          );
                        },
                        child: Card(
                          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Image.asset(
                                  cartItem.product.imageUrl,
                                  width: 50,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(cartItem.product.title),
                                      Text('Quantity: ${cartItem.quantity}'),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('\$${(cartItem.product.price * cartItem.quantity).toStringAsFixed(2)}'),
                                    Row(
                                      children: [
                                        IconButton(
                                          icon: Icon(Icons.remove),
                                          onPressed: () {
                                            if (cartItem.quantity > 1) {
                                              ref.read(cartProvider.notifier).updateQuantity(cartItem.product, cartItem.quantity - 1);
                                            }
                                          },
                                        ),
                                        Text('${cartItem.quantity}'),
                                        IconButton(
                                          icon: Icon(Icons.add),
                                          onPressed: () {
                                            ref.read(cartProvider.notifier).updateQuantity(cartItem.product, cartItem.quantity + 1);
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total Amount:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text('\$${totalAmount.toStringAsFixed(2)}', style: TextStyle(fontSize: 20, color: Colors.blueAccent)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
