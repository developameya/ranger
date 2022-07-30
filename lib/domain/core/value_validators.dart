import 'package:dartz/dartz.dart';

import 'failures.dart';

Either<ValueFailure<String>, double> validateDouble(String input) {
  final double? validatedDouble = double.tryParse(input);

  return validatedDouble == null
      ? left(
          ValueFailure.length(failure: LengthValueFailure(failedValue: input)))
      : right(validatedDouble);
}

Either<ValueFailure<String>, String> validateStringLength(
    String input, int maxLength) {
  if (input.length == maxLength) {
    return right(input);
  } else {
    return left(
      ValueFailure.stringLength(
        failure: StringLengthFailure(failedValue: input),
      ),
    );
  }
}
