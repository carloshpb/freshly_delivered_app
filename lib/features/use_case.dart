import 'dart:async';

abstract class UseCase<T, S> {
  FutureOr<S> execute({required T request});
}
