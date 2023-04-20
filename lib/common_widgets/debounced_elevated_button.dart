import 'dart:async';

import 'package:flutter/material.dart';

class DebouncedElevatedButton extends StatefulWidget {
  final Widget _child;
  final VoidCallback _onPressed;
  final ButtonStyle? _style;
  final Duration _duration;

  DebouncedElevatedButton({
    super.key,
    required Widget child,
    required VoidCallback onPressed,
    ButtonStyle? style,
    int debounceTimeMs = 500,
  })  : _child = child,
        _onPressed = onPressed,
        _style = style,
        _duration = Duration(milliseconds: debounceTimeMs);

  @override
  State<DebouncedElevatedButton> createState() =>
      _DebouncedElevatedButtonState();
}

class _DebouncedElevatedButtonState extends State<DebouncedElevatedButton> {
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
      builder: (context, isEnabled, child) => ElevatedButton(
        onPressed: isEnabled ? _onButtonPressed : null,
        style: widget._style,
        child: widget._child,
      ),
    );
  }
}
