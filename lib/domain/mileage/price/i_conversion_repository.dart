import 'package:antar/domain/mileage/price/currency.dart';

abstract class IConversionRepository {
  ExchangeRate getConversionRate(
      {required Currency from, required Currency to});
}
