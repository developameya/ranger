import 'package:antar/domain/core/failures.dart';
import 'package:antar/domain/core/value_object.dart';
import 'package:antar/domain/mileage/measurements/length.dart';
import 'package:dartz/dartz.dart';

class Distance extends ValueObject<Length> {
  @override
  final Either<ValueFailure<Length>, Length> value;

  const Distance._(this.value);

  factory Distance(Length value) => Distance._(right(value));
}
