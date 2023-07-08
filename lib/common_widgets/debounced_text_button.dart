import 'dart:async';

import 'package:flutter/material.dart';

class DebouncedTextButton extends StatefulWidget {
  final Widget _child;
  final VoidCallback _onPressed;
  final ButtonStyle? _style;
  final Duration _duration;

  DebouncedTextButton({
    super.key,
    required Widget child,
    required VoidCallback onPressed,
    ButtonStyle? style,
    int debounceTimeMs = 200,
  })  : _child = child,
        _onPressed = onPressed,
        _style = style,
        _duration = Duration(milliseconds: debounceTimeMs);

  @override
  State<DebouncedTextButton> createState() => _DebouncedTextButtonState();
}

class _DebouncedTextButtonState extends State<DebouncedTextButton> {
  late ValueNotifier<bool> _isEnabled;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _isEnabled = ValueNotifier<bool>(true);
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  void _onButtonPressed() {
    _isEnabled.value = false;
    widget._onPressed();
    _timer = Timer(widget._duration, () => _isEnabled.value = true);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _isEnabled,
      builder: (context, isEnabled, child) => TextButton(
        onPressed: isEnabled ? _onButtonPressed : null,
        style: widget._style,
        child: widget._child,
      ),
    );
  }
}
