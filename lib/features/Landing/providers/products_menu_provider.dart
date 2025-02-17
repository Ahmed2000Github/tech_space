import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_space/features/Landing/providers/account_menu_notifier.dart';

class ProductsMenuNotifier extends StateNotifier<bool> {
  ProductsMenuNotifier() : super(false);
  void toggle() {
    state = !state;
  }
}

final productsMenuNotifierProvider = StateNotifierProvider<ProductsMenuNotifier, bool>((ref) {
  return ProductsMenuNotifier();
});
