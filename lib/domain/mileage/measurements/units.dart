abstract class Length {
  const Length();
  int get value;
}

class Meter extends Length {
  @override
  final int value;

  const Meter(this.value);

  //Define method for conversion from kilometer
  factory Meter.fromKiloMeter(KiloMeter input) => Meter(
        (input.value.toDouble() * KiloMeter.downConversionFactor).round(),
      );
  //Define method for conversion to yard

  //Define method for conversion from yard
  factory Meter.fromYard(Yard input) => Meter(
        (input.value.toDouble() * Yard.metricConversionFactor).round(),
      );
}

class KiloMeter extends Length {
  @override
  final int value;
  static const double downConversionFactor = 1000;

  const KiloMeter(this.value);
}

class Yard extends Length {
  @override
  final int value;
  static const double metricConversionFactor = 0.9144;

  const Yard(this.value);
}
