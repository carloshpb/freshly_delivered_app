import 'package:rxdart/rxdart.dart';

mixin Throttler {
  // throttling functions of buttons (stop to call it twice after fast pressing it more than once)
  Function() throttle(int throttleDurationInMillis, Function() function) {
    final throttler = PublishSubject<Function()>();

    throttler
        .throttleTime(Duration(milliseconds: throttleDurationInMillis))
        .forEach((f) {
      f();
    });

    return () {
      throttler.add(function);
    };
  }
}
