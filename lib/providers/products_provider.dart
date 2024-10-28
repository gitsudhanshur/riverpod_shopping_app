import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product.dart';

final productsProvider = Provider<List<Product>>((ref) {
  return [
    Product(id: 'p1', title: 'Shirt', description: 'A nice shirt', price: 29.99, imageUrl: 'assets/images/Shirt.jpg'),
    Product(id: 'p2', title: 'Cargo', description: 'A nice cargo for mens', price: 39.99, imageUrl: 'assets/images/cargo.jpg'),
    Product(id: 'p3', title: 'Gown', description: 'A pink nice gown', price: 49.99, imageUrl: 'assets/images/gown.jpg'),
    Product(id: 'p4', title: 'Hoodie', description: 'A nice comfortable hoodie', price: 59.99, imageUrl: 'assets/images/hoodie.jpg'),
    Product(id: 'p5', title: 'Formal Pant', description: 'A nice formal pant for office work', price: 69.99, imageUrl: 'assets/images/pants.jpg'),
    Product(id: 'p6', title: 'Saree', description: 'A Banarasi Saree, very comfortable for womens', price: 109.99, imageUrl: 'assets/images/saree.jpg'),
    Product(id: 'p7', title: 'Suit', description: 'A designer suit for girls', price: 79.99, imageUrl: 'assets/images/suit.jpg'),
    Product(id: 'p8', title: 'T-shirt', description: 'A nice and streachaable t-shirt for mens', price: 89.99, imageUrl: 'assets/images/tshirt.jpg'),
  ];
});
