import 'package:flutter/material.dart';

enum ButtonState { init, loading, done }

class ButtonCircularProgress extends StatelessWidget {
  final String text;
  final ButtonState state;
  final void Function()? onPressed;

  const ButtonCircularProgress(
    this.text, {
    Key? key,
    required this.state,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //var theme = Theme.of(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeIn,
          width: (state == ButtonState.loading || state == ButtonState.done)
              ? 0.0
              : constraints.maxWidth,
          child: ElevatedButton(
            // style: ElevatedButton.styleFrom(
            //   backgroundColor: theme.colorScheme.primaryContainer,
            //   foregroundColor: theme.colorScheme.onPrimaryContainer,
            //   shape: const StadiumBorder(),
            // ),
            onPressed: (state == ButtonState.init) ? onPressed : () {},
            child: (state == ButtonState.done)
                ? const Icon(
                    Icons.check,
                    color: Colors.white,
                  )
                : (state == ButtonState.loading)
                    ? const SizedBox(
                        height: 25,
                        width: 25,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : Text(
                        text,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
          ),
        );
      },
    );
  }
}
