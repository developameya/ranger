import 'package:antar/domain/core/failures.dart';
import 'package:antar/domain/core/value_object.dart';
import 'package:antar/domain/mileage/price/currency.dart';
import 'package:dartz/dartz.dart';

class Price extends ValueObject<Currency> {
  @override
  final Either<ValueFailure<String>, Currency> value;

  const Price._(this.value);

  factory Price(Currency input) => Price._(right(input));
}
