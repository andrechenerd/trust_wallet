import 'dart:async';

import 'package:reactive_variables/reactive_variables.dart';

mixin LoadingListenable {
  final Rv<bool> isCallbackLoading = Rv(false);

  bool get isLoading => isCallbackLoading();

  Future<Result> loadable<Result, Arguments>(
      Future<Result> Function(Arguments) callback, Arguments arguments) async {
    isCallbackLoading(true);
    try {
      return await callback(arguments);
    } finally {
      isCallbackLoading(false);
    }
  }
}
