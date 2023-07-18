import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:freshly_delivered_app/features/authentication/domain/models/app_user.dart';

void main() {
  group("AppUser", () {
    const appUserJson =
        '{"uid":"moc.elpmaxe@eodnhoj", "email":"johndoe@example.com"}';
    final appUserJsonDecoded = jsonDecode(appUserJson);

    const invalidJson1 = "{'email': 'test@example.com'}"; //missing uid
    const invalidJson2 = "{'uid': 'testUid'}"; //missing email
    const invalidJson3 =
        "{'uid': 'testUid', 'email': 'test@example.com','invalidField': 'invalidValue'}"; //Additional invalid field
    const invalidJson4 =
        "{'uid': 'testUid', 'email': 123}"; // Invalid data type, should be a String

    final jsonDecoded1 = jsonDecode(invalidJson1);
    final jsonDecoded2 = jsonDecode(invalidJson2);
    final jsonDecoded3 = jsonDecode(invalidJson3);
    final jsonDecoded4 = jsonDecode(invalidJson4);

    final listInvalidJsons = [
      jsonDecoded1,
      jsonDecoded2,
      jsonDecoded3,
      jsonDecoded4
    ];

    test('''
      \n      When uses fromJson creates an instance of AppUser with a valid json
      Then return an AppUser if successful
      ''', () {
      final appUser = AppUser.fromJson(appUserJsonDecoded);

      expect(appUser.uid, 'moc.elpmaxe@eodnhoj');
      expect(appUser.email, 'johndoe@example.com');
    });

    listInvalidJsons.forEach(
      (decodedJson) => test('''
      \n      When uses fromJson creates an instance of AppUser with an ivalid json
      Then throws a FormatException
      ''', () {
        expect(
          () => AppUser.fromJson(decodedJson),
          throwsA(isA<FormatException>()),
        );
      }),
    );

    test('''
      \n      When uses toJson creates a JSON from a valid AppUser object
      Then return a JSON if successful
      ''', () {
      const appUser = AppUser(
        uid: 'testUid',
        email: 'test@example.com',
      );

      final json = appUser.toJson();

      expect(json['uid'], 'testUid');
      expect(json['email'], 'test@example.com');
    });
  });
}
