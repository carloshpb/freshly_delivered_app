import 'package:freezed_annotation/freezed_annotation.dart';

class CheckedToJsonException implements Exception {
  /// The [Error] or [Exception] that triggered this exception.
  ///
  /// If this instance was created by user code, this field will be `null`.
  final Object? innerError;

  /// The [StackTrace] for the [Error] or [Exception] that triggered this
  /// exception.
  ///
  /// If this instance was created by user code, this field will be `null`.
  final StackTrace? innerStack;

  /// The key from [map] that corresponds to the thrown [innerError].
  ///
  /// May be `null`.
  final String? key;

  /// The source [Map] that was used for decoding when the [innerError] was
  /// thrown.
  final Map map;

  /// A human-readable message corresponding to [innerError].
  ///
  /// May be `null`.
  final String? message;

  /// The name of the class being created when [innerError] was thrown.
  String? get className => _className;
  String? _className;

  /// If this was thrown due to an invalid or unsupported key, as opposed to an
  /// invalid value.
  final bool badKey;

  /// Creates a new instance of [CheckedToJsonException].
  CheckedToJsonException(
    this.map,
    this.key,
    String className,
    this.message, {
    this.badKey = false,
  })  : _className = className,
        innerError = null,
        innerStack = null;

  CheckedToJsonException._(
    Object this.innerError,
    this.innerStack,
    this.map,
    this.key, {
    String? className,
  })  : _className = className,
        badKey = innerError is BadKeyException,
        message = _getMessage(innerError);

  static String _getMessage(Object error) {
    if (error is ArgumentError) {
      final message = error.message;
      if (message != null) {
        return message.toString();
      }
    }
    if (error is BadKeyException) {
      return error.message;
    }
    if (error is FormatException) {
      var message = error.message;
      if (error.offset != null) {
        message = '$message at offset ${error.offset}.';
      }
      return message;
    }
    return error.toString();
  }

  @override
  String toString() => <String>[
        'CheckedToJsonException',
        if (_className != null) 'Could not create `$_className`.',
        if (key != null) 'There is a problem with "$key".',
        if (message != null)
          message!
        else if (innerError != null)
          innerError.toString(),
      ].join('\n');
}
