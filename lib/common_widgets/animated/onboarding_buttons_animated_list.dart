import 'package:flutter/material.dart';

class OnboardingButtonsAnimatedList extends StatefulWidget {
  final int currentIndexOnboardingMessage;
  final ButtonStyleButton topButton;
  final ButtonStyleButton middleButton;
  final ButtonStyleButton lowerButton;

  const OnboardingButtonsAnimatedList({
    super.key,
    required this.currentIndexOnboardingMessage,
    required this.topButton,
    required this.middleButton,
    required this.lowerButton,
  });

  @override
  State<StatefulWidget> createState() => _OnboardingButtonsAnimatedListState();
}

class _OnboardingButtonsAnimatedListState
    extends State<OnboardingButtonsAnimatedList> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _doubleAnimation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );
  late final Animation<RelativeRect> _rectAnimation = 

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final buttonHeight = (constraints.maxHeight - 14.0) / 3;
        return Stack(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Positioned(top: 0.0, bottom: buttonHeight ,left: 0.0, right: 0.0 , child: widget.topButton,),
            if (widget.currentIndexOnboardingMessage > 0)
              FadeTransition(opacity: _doubleAnimation, child: widget.middleButton),
            PositionedTransition(rect: , child: widget.lowerButton),
          ],
        );
      }
    );
  }
}
