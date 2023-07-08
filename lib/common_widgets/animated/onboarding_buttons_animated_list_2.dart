// import 'package:flutter/material.dart';

// class OnboardingButtonsAnimatedList2 extends StatefulWidget {
//   final int currentIndexOnboardingMessage;
//   final List<Widget> listButtons;

//   const OnboardingButtonsAnimatedList2({
//     required super.key,
//     required this.currentIndexOnboardingMessage,
//     required this.listButtons,
//   });

//   @override
//   State<OnboardingButtonsAnimatedList2> createState() =>
//       _OnboardingButtonsAnimatedList2State();
// }

// class _OnboardingButtonsAnimatedList2State
//     extends State<OnboardingButtonsAnimatedList2> {
//   final GlobalKey<AnimatedListState> _animatedListKey =
//       GlobalKey<AnimatedListState>();

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedList(
//       key: _animatedListKey,
//       initialItemCount: widget.listButtons.length,
//       itemBuilder: (context, index, animation) {
//         return SizeTransition(
//           sizeFactor: animation,
//           child: animatedLowerButton,
//         );
//       },
//     );
//   }
// }
