import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freshly_delivered_app/features/authentication/data/repositories/onboarding_messages_repository_impl.dart';
import 'package:freshly_delivered_app/features/authentication/domain/repositories/onboarding_messages_repository.dart';
import 'package:freshly_delivered_app/features/top_level_providers.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../base_mock.mocks.dart';

void main() {
  late ProviderContainer container;
  late OnboardingMessagesRepository onboardingMessagesRepository;
  late SharedPreferences sharedPreferences;

  final List<String> initialValues = [
    {
      'imageSvgPath': 'imagePath1.svg.vec',
      'title': 'TITLE1',
      'message': 'message1',
    },
    {
      'imageSvgPath': 'imagePath2.svg.vec',
      'title': 'TITLE2',
      'message': 'message2',
    },
    {
      'imageSvgPath': 'imagePath3.svg.vec',
      'title': 'TITLE3',
      'message': 'message3',
    },
  ].map((e) => json.encode(e)).toList();

  setUp(() async {
    final prefs = MockSharedPreferences();

    container = ProviderContainer(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
        onboardingMessagesRepositoryProvider.overrideWithValue(
          OnboardingMessagesRepositoryImpl(prefs),
        ),
      ],
    );

    onboardingMessagesRepository =
        container.read(onboardingMessagesRepositoryProvider);

    sharedPreferences = container.read(sharedPreferencesProvider);
  });

  tearDown(() {
    container.dispose();
  });

  test('onboardingMessages - returns correct list of messages', () {
    when(sharedPreferences.getStringList("onboardingMessages"))
        .thenReturn(initialValues);

    final messages = onboardingMessagesRepository.onboardingMessages;

    expect(messages.length, 3);

    var count = 0;
    while (count < messages.length) {
      expect(messages[count].imageSvgPath, 'imagePath${count + 1}.svg.vec');
      expect(messages[count].title, 'TITLE${count + 1}');
      expect(messages[count].message, 'message${count + 1}');
      count++;
    }
  });

  test('onboardingMessages - handles missing or empty shared preferences', () {
    when(sharedPreferences.getStringList("onboardingMessages"))
        .thenReturn(null);

    final messages = onboardingMessagesRepository.onboardingMessages;

    expect(messages.length, 3);

    // Verify the properties of each default message
    expect(messages[0].imageSvgPath, 'assets/images/onboarding1.svg.vec');
    expect(messages[0].title, 'SHOP CONVENIENTLY');
    expect(
      messages[0].message,
      'Shop from an unlimited stock of groceries from the convenience of your homes',
    );

    expect(messages[1].imageSvgPath, 'assets/images/onboarding2.svg.vec');
    expect(messages[1].title, 'EXPERTLY CURATED RECIPES');
    expect(
      messages[1].message,
      'Our recipes are prepared in the finest of conditions by experts in their fields',
    );

    expect(messages[2].imageSvgPath, 'assets/images/onboarding3.svg.vec');
    expect(messages[2].title, 'BRING OUT THE CHEF IN YOU');
    expect(
      messages[2].message,
      'Our recipes are specially picked so you can get cooking in no time',
    );
  });

  test('onboardingMessages - handles invalid JSON in shared preferences', () {
    when(sharedPreferences.getStringList("onboardingMessages"))
        .thenReturn(["{invalidJson"]);

    expect(
      () => onboardingMessagesRepository.onboardingMessages,
      throwsFormatException,
    );
  });

  test('onboardingMessages - handles corrupted shared preferences data', () {
    when(sharedPreferences.getStringList("onboardingMessages"))
        .thenReturn(["{}"]);

    var messages = onboardingMessagesRepository.onboardingMessages;

    expect(messages.length, 3);

    // Verify the properties of each default message
    expect(messages[0].imageSvgPath, 'assets/images/onboarding1.svg.vec');
    expect(messages[0].title, 'SHOP CONVENIENTLY');
    expect(
      messages[0].message,
      'Shop from an unlimited stock of groceries from the convenience of your homes',
    );

    expect(messages[1].imageSvgPath, 'assets/images/onboarding2.svg.vec');
    expect(messages[1].title, 'EXPERTLY CURATED RECIPES');
    expect(
      messages[1].message,
      'Our recipes are prepared in the finest of conditions by experts in their fields',
    );

    expect(messages[2].imageSvgPath, 'assets/images/onboarding3.svg.vec');
    expect(messages[2].title, 'BRING OUT THE CHEF IN YOU');
    expect(
      messages[2].message,
      'Our recipes are specially picked so you can get cooking in no time',
    );

    when(sharedPreferences.getStringList("onboardingMessages")).thenReturn([
      json.encode({
        'imageSvgPath': true,
        'title': 'NEW MESSAGE',
        'message': 'This is a new onboarding message',
      })
    ]);

    messages = onboardingMessagesRepository.onboardingMessages;

    expect(messages.length, 3);

    // Verify the properties of each default message
    expect(messages[0].imageSvgPath, 'assets/images/onboarding1.svg.vec');
    expect(messages[0].title, 'SHOP CONVENIENTLY');
    expect(
      messages[0].message,
      'Shop from an unlimited stock of groceries from the convenience of your homes',
    );

    expect(messages[1].imageSvgPath, 'assets/images/onboarding2.svg.vec');
    expect(messages[1].title, 'EXPERTLY CURATED RECIPES');
    expect(
      messages[1].message,
      'Our recipes are prepared in the finest of conditions by experts in their fields',
    );

    expect(messages[2].imageSvgPath, 'assets/images/onboarding3.svg.vec');
    expect(messages[2].title, 'BRING OUT THE CHEF IN YOU');
    expect(
      messages[2].message,
      'Our recipes are specially picked so you can get cooking in no time',
    );

    when(sharedPreferences.getStringList("onboardingMessages")).thenReturn([
      json.encode({
        'title': 'NEW MESSAGE',
        'message': 'This is a new onboarding message',
      })
    ]);

    messages = onboardingMessagesRepository.onboardingMessages;

    expect(messages.length, 3);

    // Verify the properties of each default message
    expect(messages[0].imageSvgPath, 'assets/images/onboarding1.svg.vec');
    expect(messages[0].title, 'SHOP CONVENIENTLY');
    expect(
      messages[0].message,
      'Shop from an unlimited stock of groceries from the convenience of your homes',
    );

    expect(messages[1].imageSvgPath, 'assets/images/onboarding2.svg.vec');
    expect(messages[1].title, 'EXPERTLY CURATED RECIPES');
    expect(
      messages[1].message,
      'Our recipes are prepared in the finest of conditions by experts in their fields',
    );

    expect(messages[2].imageSvgPath, 'assets/images/onboarding3.svg.vec');
    expect(messages[2].title, 'BRING OUT THE CHEF IN YOU');
    expect(
      messages[2].message,
      'Our recipes are specially picked so you can get cooking in no time',
    );
  });

  test('onboardingMessages - updates messages from server', () {
    when(sharedPreferences.getStringList("onboardingMessages")).thenReturn([
      json.encode({
        'imageSvgPath': 'assets/images/onboarding4.svg.vec',
        'title': 'NEW MESSAGE',
        'message': 'This is a new onboarding message',
      })
    ]);

    final messages = onboardingMessagesRepository.onboardingMessages;

    expect(messages.length, 1);
    expect(messages[0].imageSvgPath, 'assets/images/onboarding4.svg.vec');
    expect(messages[0].title, 'NEW MESSAGE');
    expect(messages[0].message, 'This is a new onboarding message');
  });
}
