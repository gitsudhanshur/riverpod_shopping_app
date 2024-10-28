import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/cart.dart';
import '../models/product.dart';

class CartNotifier extends StateNotifier<List<CartItem>> {
  CartNotifier() : super([]);

  // Add a product to the cart
  void addProduct(Product product, {int quantity = 1}) {
    final index = state.indexWhere((item) => item.product.id == product.id);
    if (index == -1) {
      state = [...state, CartItem(product: product, quantity: quantity)];
    } else {
      state[index].quantity += quantity;
      state = List.from(state); // Notify listeners
    }
  }

  void updateQuantity(Product product, int newQuantity) {
    final index = state.indexWhere((item) => item.product.id == product.id);
    if (index != -1) {
      state[index].quantity = newQuantity;
      state = List.from(state); // Notify listeners
    }
  }

  void removeProduct(Product product) {
    state.removeWhere((item) => item.product.id == product.id);
    state = List.from(state); // Notify listeners
  }
}

final cartProvider = StateNotifierProvider<CartNotifier, List<CartItem>>((ref) {
  return CartNotifier();
});
