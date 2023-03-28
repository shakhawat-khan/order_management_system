import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final textControllerProvider =
    Provider.autoDispose.family((_, String __) => TextEditingController());

final passwordProvider = NotifierProvider<PasswordVisibleNotifier, bool>(PasswordVisibleNotifier.new);

class PasswordVisibleNotifier extends Notifier<bool> {
  @override
  bool build() {
    return true;
  }

  void visible(bool changeState) {
    state = changeState;
  }
}
