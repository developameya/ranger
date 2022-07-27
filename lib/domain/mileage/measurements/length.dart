import 'package:antar/domain/core/failures.dart';
import 'package:antar/domain/core/value_object.dart';
import 'package:antar/domain/core/value_validators.dart';
import 'package:dartz/dartz.dart';

abstract class Length extends ValueObject<double> {
  const Length();
  @override
  Either<ValueFailure<String>, double> get value;
}

class Meter extends Length {
  @override
  final Either<ValueFailure<String>, double> value;

  const Meter._(this.value);

  factory Meter(String input) => Meter._(validateDouble(input));

  //Define method for conversion from kilometer
  factory Meter.fromKiloMeter(KiloMeter input) => Meter._(
        right(input.getPrimitive * KiloMeter.downConversionFactor),
      );
  //Define method for conversion to yard

  //Define method for conversion from yard
  factory Meter.fromYard(Yard input) => Meter._(
        right(input.getPrimitive * Yard.metricConversionFactor),
      );
}

class KiloMeter extends Length {
  @override
  final Either<ValueFailure<String>, double> value;
  static const double downConversionFactor = 1000;

  const KiloMeter._(this.value);

  factory KiloMeter(String input) => KiloMeter._(validateDouble(input));
}

class Yard extends Length {
  @override
  final Either<ValueFailure<String>, double> value;
  static const double metricConversionFactor = 0.9144;

  const Yard._(this.value);

  factory Yard(String input) => Yard._(validateDouble(input));
}
