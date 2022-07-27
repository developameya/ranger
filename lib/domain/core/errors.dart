import 'failures.dart';

class UnexpectedValueError extends Error {
  final ValueFailure valueFailure;

  UnexpectedValueError(this.valueFailure);

  @override
  String toString() {
    const explaination =
        'Encountered a value falilure at an unrecoverable point. Terminating.';
    //[Error.safeToString] ensures that the error is formatted correctly in different environments.
    return Error.safeToString('$explaination Failure was: $valueFailure');
  }
}
