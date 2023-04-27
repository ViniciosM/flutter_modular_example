import 'base_error.dart';

abstract class Result<T> {
  T? _success;
  BaseError? _error;

  Result(Object object) {
    if (object is ResultSuccess) {
      _success = object as T;
    }

    if (object is ResultError) {
      _error = object as BaseError;
    }
  }

  bool get isSuccess => _success != null;

  bool get isError => _error != null;

  T get getSuccessData => _success!;

  BaseError get getErrorData => _error!;
}

class ResultSuccess<S> extends Result<S> {
  final S success;

  ResultSuccess(this.success) : super(success!);
}

class ResultError<E> extends Result<E> {
  final BaseError error;

  ResultError(this.error) : super(error);
}

class ResultErrorList<E> extends Result<E> {
  final List<BaseError> errors;

  ResultErrorList(this.errors) : super(errors);
}
