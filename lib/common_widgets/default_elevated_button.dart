import 'package:flutter/material.dart';

@Deprecated("Use normal ElevatedButton instead")
class DefaultElevatedButton extends StatelessWidget {
  final void Function()? _onPressed;
  final Color _backgroundColor;
  final Color _disabledBackgroundColor;
  final Size _minimumSize;
  final String _text;
  final TextStyle _style;

  const DefaultElevatedButton({
    super.key,
    required void Function()? onPressed,
    Color backgroundColor = const Color.fromRGBO(23, 104, 46, 1.0),
    Color disabledBackgroundColor = const Color.fromRGBO(23, 104, 46, 0.5),
    Size minimumSize = const Size.fromHeight(54.0),
    required String text,
    TextStyle style = const TextStyle(color: Colors.white),
  })  : _onPressed = onPressed,
        _backgroundColor = backgroundColor,
        _disabledBackgroundColor = disabledBackgroundColor,
        _minimumSize = minimumSize,
        _text = text,
        _style = style;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _onPressed,
      style: ElevatedButton.styleFrom(
        disabledBackgroundColor: _disabledBackgroundColor,
        minimumSize: _minimumSize,
        backgroundColor: _backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
      ),
      child: Text(
        _text,
        style: _style,
      ),
    );
  }
}
