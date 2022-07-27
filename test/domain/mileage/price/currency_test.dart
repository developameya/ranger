import 'package:antar/domain/mileage/price/currency.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Test the `Rupee` currency functions.', () {
    test('Test the conversion of dollar to rupee.', () {
      final Dollar t = Dollar('2');
      final ConversionRate rate = ConversionRate('80');

      expect(Rupee.convertFrom(value: t, rate: rate), Rupee('160'));
    });
  });
}
