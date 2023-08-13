import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

//import 'error_logger.dart';

/// Error logger class to keep track of all AsyncError states that are set
/// by the controllers in the app
class AsyncErrorLogger extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    //final errorLogger = container.read(errorLoggerProvider);
    final logger = Logger();
    final asyncError = _findError(newValue);
    if (asyncError != null) {
      if (asyncError.error is Exception) {
        // only prints the AppException data
        logger.e(asyncError.error as Exception);
        //errorLogger.logException(error.error as Exception);
      } else {
        // prints everything including the stack trace
        logger.f("ASYNCVALUE ERROR",
            error: asyncError.error, stackTrace: asyncError.stackTrace);
        //errorLogger.logError(error.error, error.stackTrace);
      }
    }
  }

  AsyncError<dynamic>? _findError(Object? value) {
    if (value is AsyncError) {
      return value;
    } else {
      return null;
    }
  }
}
