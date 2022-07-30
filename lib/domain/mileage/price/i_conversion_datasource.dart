abstract class IConversionDatasource {
  Future<String> fetchExchangeRate({required String from, required String to});
}
