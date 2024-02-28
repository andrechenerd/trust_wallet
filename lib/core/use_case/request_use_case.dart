import 'dart:async';

abstract interface class RequestUseCase<Result, Arguments> {
  Future<Result> call(Arguments arguments);
}
