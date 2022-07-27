import 'package:dartz/dartz.dart';

import 'failures.dart';

Either<ValueFailure<String>, double> validateDouble(String input) {
  final double? validatedDouble = double.tryParse(input);

  return validatedDouble == null
      ? left(
          ValueFailure.length(failure: LengthValueFailure(failedValue: input)))
      : right(validatedDouble);
}
