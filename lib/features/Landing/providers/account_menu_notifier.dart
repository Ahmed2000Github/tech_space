import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountMenuNotifier extends StateNotifier<bool> {
  AccountMenuNotifier() : super(false);
  void toggle() {
    state = !state;
  }
  void close() {
    state = false;
  }
}
final accountMenuNotifierProvider =
    StateNotifierProvider<AccountMenuNotifier, bool>((ref) {
  return AccountMenuNotifier();
});
