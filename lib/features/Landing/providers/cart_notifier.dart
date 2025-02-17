import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartNotifier extends StateNotifier<bool> {
  CartNotifier() : super(false);
  void toggle() {
    state = !state;
  }

  void close() {
    state = false;
  }
}

final cartNotifierProvider =
    StateNotifierProvider<CartNotifier, bool>((ref) {
  return CartNotifier();
});
