import 'package:antar/domain/core/failures.dart';
import 'package:antar/domain/core/value_object.dart';
import 'package:antar/domain/core/value_validators.dart';
import 'package:dartz/dartz.dart';

// ignore: must_be_immutable
abstract class Currency extends ValueObject<double> {
  @override
  Either<ValueFailure<String>, double> get value;
  // ignore: unused_element
  // ConversionRate _rate;

  const Currency(); //: _rate = ConversionRate('rate not set');

  // setRate(String input) => _rate = ConversionRate(input);

  // ConversionRate get getRate => _rate;
}

class ConversionRate extends ValueObject<double> {
  @override
  final Either<ValueFailure<String>, double> value;

  const ConversionRate._(this.value);

  factory ConversionRate(String input) =>
      ConversionRate._(validateDouble(input));
}

// ignore: must_be_immutable
class Rupee extends Currency {
  @override
  final Either<ValueFailure<String>, double> value;

  const Rupee._(this.value);

  factory Rupee(String input) => Rupee._(validateDouble(input));

  factory Rupee.convertFrom(
          {required Currency value, required ConversionRate rate}) =>
      Rupee._(
        right(value.getPrimitive * rate.getPrimitive),
      );
}

// ignore: must_be_immutable
class Dollar extends Currency {
  @override
  final Either<ValueFailure<String>, double> value;

  const Dollar._(this.value);

  factory Dollar(String input) => Dollar._(validateDouble(input));
}
