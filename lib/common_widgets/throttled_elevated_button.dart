import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class ThrottledElevatedButton extends StatelessWidget {
  final Widget _child;
  final VoidCallback _onPressed;
  final ButtonStyle? _style;

  const ThrottledElevatedButton({
    super.key,
    required Widget child,
    required VoidCallback onPressed,
    ButtonStyle? style,
  })  : _child = child,
        _onPressed = onPressed,
        _style = style;

  // Example : https://mustansir.dev/posts/easily-throttle-in-flutter/

  Function() throttle(int throttleDurationInMillis, Function() function) {
    final throttler = PublishSubject<Function()>();

    throttler
        .throttle(
      Duration(milliseconds: throttleDurationInMillis),
    )
        .forEach((f) {
      f();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isEnabled ? _onButtonPressed : null,
      style: widget._style,
      child: widget._child,
    );
  }
}
