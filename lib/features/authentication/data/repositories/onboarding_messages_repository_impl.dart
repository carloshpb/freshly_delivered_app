import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../top_level_providers.dart';
import '../../domain/models/onboarding_message.dart';
import '../../domain/repositories/onboarding_messages_repository.dart';

final onboardingMessagesRepositoryProvider =
    Provider.autoDispose<OnboardingMessagesRepository>(
  (ref) {
    var sharedPref = ref.watch(sharedPreferencesProvider);
    final repo = OnboardingMessagesRepositoryImpl(sharedPref);
    ref.keepAlive();
    return repo;
  },
  name: r"onboardingMessagesRepositoryProvider",
);

// Use this repo to update messages from serverside
class OnboardingMessagesRepositoryImpl implements OnboardingMessagesRepository {
  final SharedPreferences _sharedPreferences;

  OnboardingMessagesRepositoryImpl(this._sharedPreferences) {
    var messageList = _sharedPreferences.getStringList("onboardingMessages");
    if (messageList == null || messageList.isEmpty) {
      final onboardingMessages = [
        {
          'imageSvgPath': 'assets/images/onboarding1.svg.vec',
          'title': 'SHOP CONVENIENTLY',
          'message':
              'Shop from an unlimited stock of groceries from the convenience of your homes',
        },
        {
          'imageSvgPath': 'assets/images/onboarding2.svg.vec',
          'title': 'EXPERTLY CURATED RECIPES',
          'message':
              'Our recipes are prepared in the finest of conditions by experts in their fields',
        },
        {
          'imageSvgPath': 'assets/images/onboarding3.svg.vec',
          'title': 'BRING OUT THE CHEF IN YOU',
          'message':
              'Our recipes are specially picked so you can get cooking in no time',
        },
      ];
      _sharedPreferences.setStringList("onboardingMessages",
          onboardingMessages.map((msg) => json.encode(msg)).toList());
    }
  }

  @override
  List<OnboardingMessage> get onboardingMessages {
    var messageList = _sharedPreferences.getStringList("onboardingMessages")!;
    return messageList
        .map((msg) => OnboardingMessage.fromJson(json.decode(msg)))
        .toList();
  }
}
