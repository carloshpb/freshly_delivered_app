import 'package:freezed_annotation/freezed_annotation.dart';

import '../constants/strings.dart';

part 'app_connection_exception.freezed.dart';

@freezed
sealed class AppConnectionException
    with _$AppConnectionException
    implements Exception {
  const AppConnectionException._();

  const factory AppConnectionException.internetOff() = InternetOffException;
  const factory AppConnectionException.serverOff() = ServerOffException;

  String message() {
    switch (this) {
      case InternetOffException():
        return Strings.internetOff;
      case ServerOffException():
        return Strings.serverOff;
    }
  }
}
