import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../../models/screens_models/search_model.dart';
import '../../../web_server/coin_api.dart';
import '../../../web_server/dio_exceptions.dart';

class SearchScreenProvider extends ChangeNotifier {
  List<SearchModel> searchScreenList = [];

  void getCurrencyData(String searchChar) async {
    try {
      await CoinApi().getSearchCurrencyDataFromApi(searchChar).then((value) {

        searchScreenList = value;
        print(value);//took list from api function and passed it to home screen list
        notifyListeners();

      });



    } on DioError catch (e) {
      String error = DioExceptions.fromDioError(e).toString();
      //print(error);
    }
  }
}
