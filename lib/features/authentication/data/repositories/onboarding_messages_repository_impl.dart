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

  OnboardingMessagesRepositoryImpl(this._sharedPreferences);

  @override
  List<OnboardingMessage> get onboardingMessages {
    List<OnboardingMessage> decodedList;
    var messageList = _sharedPreferences.getStringList("onboardingMessages");

    if (messageList == null || messageList.isEmpty) {
      decodedList = [];
    } else {
      // may throw TypeError
      decodedList = messageList
          .map((msg) => OnboardingMessage.fromJson(json.decode(msg)))
          .toList();
    }

    return decodedList;
  }

  @override
  set onboardingMessages(List<OnboardingMessage> messages) {
    var encodedList = messages.map((e) => jsonEncode(e.toJson())).toList();

    _sharedPreferences.setStringList("onboardingMessages", encodedList);
  }

  @override
  void addOnboardingMessage(OnboardingMessage message) {
    var encodedMessage = jsonEncode(message.toJson());

    var messageList = _sharedPreferences.getStringList("onboardingMessages");

    if (messageList == null || messageList.isEmpty) {
      messageList = [];
    }

    messageList.add(encodedMessage);

    _sharedPreferences.setStringList("onboardingMessages", messageList);
  }
}
