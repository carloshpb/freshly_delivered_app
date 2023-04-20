import 'package:flutter/material.dart';

class ThrottledTextButton extends StatelessWidget {
  final Widget _child;
  final VoidCallback _onPressed;
  final ButtonStyle? _style;

  const ThrottledTextButton({
    super.key,
    required Widget child,
    required VoidCallback onPressed,
    ButtonStyle? style,
  })  : _child = child,
        _onPressed = onPressed,
        _style = style;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
