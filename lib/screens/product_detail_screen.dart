import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product.dart';
import '../providers/cart_provider.dart';

class ProductDetailScreen extends ConsumerStatefulWidget {
  final Product product;

  ProductDetailScreen(this.product);

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends ConsumerState<ProductDetailScreen> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              widget.product.imageUrl,
              height: 250,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 16),
            Text(
              widget.product.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              widget.product.description,
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            SizedBox(height: 16),
            Text(
              '\$${widget.product.price}',
              style: TextStyle(fontSize: 20, color: Colors.blueAccent),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          if (quantity > 1) quantity--;
                        });
                      },
                    ),
                    Text(
                      '$quantity',
                      style: TextStyle(fontSize: 18),
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          quantity++;
                        });
                      },
                    ),
                  ],
                ),
                ElevatedButton.icon(
                  icon: Icon(Icons.shopping_cart),
                  label: Text('Add to Cart'),
                  onPressed: () {
                    ref.read(cartProvider.notifier).addProduct(widget.product, quantity: quantity);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${widget.product.title} added to cart')),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
