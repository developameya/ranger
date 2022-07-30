import 'package:antar/domain/mileage/price/i_conversion_datasource.dart';
import 'package:antar/infrastructure/constants.dart';
import 'package:http/http.dart';

class ConversionDataSource implements IConversionDatasource {
  final Client _client;
  const ConversionDataSource(this._client);
  @override
  Future<String> fetchExchangeRate(
      {required String from, required String to}) async {
    Uri url =
        Uri.https(exchangeRateBaseUrl, '/$exchangeRateApiKey/latest/$from');

    final Response response = await _client.get(url);
    return response.body;
  }
}
