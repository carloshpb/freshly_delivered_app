import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vector_graphics/vector_graphics.dart';

import '../features/authentication/domain/models/onboarding_message.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingMessage _onboardingMessage;

  const OnboardingPage({
    super.key,
    required OnboardingMessage onboardingMessage,
  }) : _onboardingMessage = onboardingMessage;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          constraints: constraints,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: 4,
                child: SvgPicture(
                  AssetBytesLoader(
                    _onboardingMessage.imageSvgPath,
                  ),
                  fit: BoxFit.fitHeight,
                ),
              ),
              const Spacer(),
              Flexible(
                child: Text(
                  _onboardingMessage.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color.fromRGBO(37, 197, 115, 1.0),
                    fontWeight: FontWeight.w700,
                    fontSize: 18.0,
                    height: 1.5,
                  ),
                ),
              ),
              const SizedBox(
                height: 7.0,
              ),
              Flexible(
                child: Text(
                  _onboardingMessage.message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 14.0,
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
