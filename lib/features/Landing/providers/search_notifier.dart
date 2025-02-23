import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchNotifier extends StateNotifier<bool> {
  SearchNotifier() : super(false);
  void toggle() {
    state = !state;
  }

  void close() {
    state = false;
  }
}
final searchNotifierProvider =
    StateNotifierProvider<SearchNotifier, bool>((ref) {
  return SearchNotifier();
});