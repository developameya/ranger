import 'package:antar/domain/mileage/measurements/units.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'Converts a value of kilometer to meter',
    () {
      const lengthInKilometer = KiloMeter(10);

      expect(Meter.fromKiloMeter(lengthInKilometer).value, 10000);
    },
  );

  test('Converts a value of yard to meter', () {
    const lengthInYard = Yard(10);

    expect(Meter.fromYard(lengthInYard).value, 9);
  });
}
