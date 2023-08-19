import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

//TODO : change to StateNotifier
/// This class was included
class GoRouterRefreshStream extends Notifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (dynamic _) => notifyListeners(),
        );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
