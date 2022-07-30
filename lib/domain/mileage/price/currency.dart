import 'package:antar/domain/core/failures.dart';
import 'package:antar/domain/core/value_object.dart';
import 'package:antar/domain/core/value_transformers.dart';
import 'package:antar/domain/core/value_validators.dart';
import 'package:dartz/dartz.dart';

// ignore: must_be_immutable
abstract class Currency extends ValueObject<double> {
  @override
  Either<ValueFailure<String>, double> get value;
  // ignore: unused_element
  // ConversionRate _rate;
  CurrencyCode get code;

  const Currency(); //: _rate = ConversionRate('rate not set');

  // setRate(String input) => _rate = ConversionRate(input);

  // ConversionRate get getRate => _rate;
}

class ExchangeRate extends ValueObject<double> {
  @override
  final Either<ValueFailure<String>, double> value;

  const ExchangeRate._(this.value);

  factory ExchangeRate(String input) => ExchangeRate._(validateDouble(input));
}

class CurrencyCode extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  const CurrencyCode._(this.value);

  static const maxLength = 3;

  factory CurrencyCode(String input) => CurrencyCode._(
        validateStringLength(input, maxLength).flatMap(makeCaps),
      );
}

// ignore: must_be_immutable
class Rupee extends Currency {
  @override
  final Either<ValueFailure<String>, double> value;

  @override
  CurrencyCode get code => CurrencyCode('inr');

  const Rupee._(this.value);

  factory Rupee(String input) => Rupee._(validateDouble(input));

  factory Rupee.convertFrom(
          {required Currency value, required ExchangeRate rate}) =>
      Rupee._(
        right(value.getPrimitive * rate.getPrimitive),
      );
}

// ignore: must_be_immutable
class Dollar extends Currency {
  @override
  final Either<ValueFailure<String>, double> value;

  @override
  CurrencyCode get code => CurrencyCode('usd');

  const Dollar._(this.value);

  factory Dollar(String input) => Dollar._(validateDouble(input));
}
