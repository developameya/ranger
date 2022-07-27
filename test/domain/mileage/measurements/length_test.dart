import 'package:antar/domain/core/failures.dart';
import 'package:antar/domain/mileage/measurements/length.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'Test `Meter` unit functions.',
    () {
      group('Tests conversion methods.', () {
        test(
          'Converts a value of kilometer to meter.',
          () {
            final lengthInKilometer = KiloMeter('10');

            expect(Meter.fromKiloMeter(lengthInKilometer).value, right(10000));
          },
        );

        test(
          'Converts a value of yard to meter.',
          () {
            final lengthInYard = Yard('10');

            expect(Meter.fromYard(lengthInYard).value, right(9.144));
          },
        );
      });
      group('Tests validation methods.', () {
        test('Get a validated double value from string.', () {
          const validLengthInString = '125.879';
          final validatedMeter = Meter(validLengthInString);

          expect(validatedMeter.value, right(125.879));
        });

        test('Get a `ValueFailure` on recieving invalid string.', () {
          const invalidLengthString = 'Invalid length string';
          final validatedMeter = Meter(invalidLengthString);

          expect(
              validatedMeter.value,
              left(const ValueFailure.length(
                  failure: LengthValueFailure(
                      failedValue: 'Invalid length string'))));
        });
      });
    },
  );

  group('Test `KiloMeter` unit functions', () {
    group('Tests validation methods.', () {
      test('Get a validated double value from string.', () {
        const validLengthInString = '125.879';
        final validatedMeter = KiloMeter(validLengthInString);

        expect(validatedMeter.value, right(125.879));
      });

      test('Get a `ValueFailure` on recieving invalid string.', () {
        const invalidLengthString = 'Invalid length string';
        final validatedMeter = KiloMeter(invalidLengthString);

        expect(
            validatedMeter.value,
            left(const ValueFailure.length(
                failure:
                    LengthValueFailure(failedValue: 'Invalid length string'))));
      });
    });
  });

  group('Test `Yard` unit functions', () {
    group('Tests validation methods.', () {
      test('Get a validated double value from string.', () {
        const validLengthInString = '125.879';
        final validatedMeter = Yard(validLengthInString);

        expect(validatedMeter.value, right(125.879));
      });

      test('Get a `ValueFailure` on recieving invalid string.', () {
        const invalidLengthString = 'Invalid length string';
        final validatedMeter = Yard(invalidLengthString);

        expect(
            validatedMeter.value,
            left(const ValueFailure.length(
                failure:
                    LengthValueFailure(failedValue: 'Invalid length string'))));
      });
    });
  });
}
