import 'package:flutter_riverpod/flutter_riverpod.dart';

final checkboxProvider =
    NotifierProvider<CheckboxNotifier, bool>(CheckboxNotifier.new);

class CheckboxNotifier extends Notifier<bool> {
  @override
  bool build() {
    return false;
  }

  void changeValue(bool value) {
    state = value;
  }
}
