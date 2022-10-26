import 'dart:convert';
import 'dart:developer';
import 'package:currency_converter_app/modals/converter.dart';
import 'package:http/http.dart' as http;

class CurrencyConverterHelper {
  CurrencyConverterHelper._();

  static final CurrencyConverterHelper currencyConverterHelper = CurrencyConverterHelper._();

  Future<Converter?> convertCurrency({required String want, required String have, required double amount}) async {
    http.Response response = await http.get(Uri.parse("https://api.api-ninjas.com/v1/convertcurrency?want=$want&have=$have&amount=$amount"), headers: {
      "X-API-Key": "yagBhMB92gTUUUw9kb3Fvw==maoHhxPMMr1bW7nk",
    });

    if (response.statusCode == 200) {
      Map decodedData = jsonDecode(response.body);

      double rawData = decodedData["new_amount"];

      Converter data = Converter.fromMap(data: rawData);

      return data;
    }
    return null;
  }
}
