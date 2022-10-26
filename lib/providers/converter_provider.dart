import 'package:currency_converter_app/modals/converter.dart';
import 'package:currency_converter_app/providers/converter_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ConverterProvider extends ChangeNotifier{

  Converter? data = Converter(amount: 0);

  void convertCurrencies ({required String want, required String have, required double amount}) async {

   data = await CurrencyConverterHelper.currencyConverterHelper.convertCurrency(want: want, have: have, amount: amount);
    notifyListeners();
  }


}