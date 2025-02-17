import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavBarItemHoverNotifier extends StateNotifier<int>{
  NavBarItemHoverNotifier() : super(0);
  void toggle(int index) {
    state = index;
  }
}

final navBarItemHoverNotifier =
    StateNotifierProvider<NavBarItemHoverNotifier, int>((ref) {
  return NavBarItemHoverNotifier();
});
