import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants/custom_colors.dart';
import '../../constants/strings.dart';
import '../../utils/throttler.dart';

// State providers for NEXT button, to be able to throttle it
final _nextTextStateProvider = StateProvider.autoDispose<String>(
  (ref) => Strings.next.toUpperCase(),
);

class AnimatedButtonList extends StatefulWidget {
  final int _nextLength;
  final VoidCallback? _onPressedNextButton;
  final VoidCallback? _onPressedLastButton;

  const AnimatedButtonList({
    super.key,
    required int nextLength,
    void Function()? onPressedNextButton,
    void Function()? onPressedLastButton,
  })  : _nextLength = nextLength,
        _onPressedNextButton = onPressedNextButton,
        _onPressedLastButton = onPressedLastButton;

  @override
  State<AnimatedButtonList> createState() => _AnimatedButtonListState();
}

class _AnimatedButtonListState extends State<AnimatedButtonList>
    with Throttler {
  late final List<Widget> _lowerButtons;
  late final Widget _backButton;

  @override
  void initState() {
    super.initState();

    _lowerButtons = <Widget>[
      Consumer(
        builder: (context, ref, child) {
          return ElevatedButton(
            onPressed: throttle(
              250,
              ref.watch(nextFunctionStateProvider),
            ),
            child: Text(
              ref.watch(_nextTextStateProvider),
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          );

          //! Code below doesn't work for throttling. Throttling it while using watch over it, will make the throttle be ignore and call another function over it, due to the change of state
          //! Riverpod still doesn't have a better way to handle throttling in a single provider
          // return DefaultElevatedButton(
          //   onPressed: (ref.watch(onboardingControllerProvider) ==
          //           onboardingMessages.length - 1)
          //       ? _goToLoginScreen
          //       : () => throttle(
          //             300,
          //             () => ref
          //                 .watch(onboardingControllerProvider.notifier)
          //                 .onPageChanged(
          //                     ref.watch(onboardingControllerProvider) + 1),
          //           ),
          //   text: (ref.watch(onboardingControllerProvider) ==
          //           onboardingMessages.length - 1)
          //       ? "GET STARTED"
          //       : "NEXT",
          // );
        },
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: _goToLoginScreen,
            style: TextButton.styleFrom(
              splashFactory: NoSplash.splashFactory,
            ),
            child: const Text(
              Strings.skip,
              style: TextStyle(
                color: CustomColors.buttonGreen,
                fontWeight: FontWeight.normal,
                fontSize: 12.0,
              ),
            ),
          ),
        ],
      ),
    ];

    _backButton = Consumer(
      builder: (context, ref, child) {
        return Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: ElevatedButton(
            onPressed: throttle(
              350,
              () => ref
                  .watch(onboardingControllerProvider.notifier)
                  .onPageChanged(
                      ref.watch(onboardingControllerProvider).pagePosition - 1),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: CustomColors.buttonGreyDeactivated,
            ),
            child: Text(
              Strings.back.toUpperCase(),
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: CustomColors.buttonGreen,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: widget.key,
      initialItemCount: _lowerButtons.length,
      shrinkWrap: true,
      itemBuilder: (context, index, animation) {
        print("CURRENT LIST : $_lowerButtons");
        print("CURRENT INDEX : $index");
        return FadeTransition(
          opacity: animation,
          child: _lowerButtons[index],
        );
      },
    );
  }
}
