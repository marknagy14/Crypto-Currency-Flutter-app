import 'package:crypto_currency/core/constants.dart';
import 'package:crypto_currency/models/screens_models/details_model.dart';
import 'package:crypto_currency/models/screens_models/search_model.dart';
import 'package:crypto_currency/web_server/dio_exceptions.dart';
import 'package:dio/dio.dart';

import '../models/screens_models/home_model.dart';

class CoinApi{

  Future <List<HomeModel>> getHomeCurrencyDataFromApi() async {
    try {
      print("entered get currency data method");

      var response = await Dio().get(
          baseUrl+homeAllCoinEndPoint);
      //print(response.data);

       return List<HomeModel>.from(
          response.data.map((element) => HomeModel.fromJson(element)));
    } catch (e) {
      rethrow;
    }
  }

  Future <List<SearchModel>> getSearchCurrencyDataFromApi(String value) async {
    try {
      print("entered get search currency data method");
      var response = await Dio().get(
          baseUrl+searchAllCoinEndPoint+value);
      print(response.data);
      return List<SearchModel>.from(
          response.data["coins"].map((element) => SearchModel.fromJson(element)));


    }  catch (e) {
      print(e);
      rethrow;
    }
  }

  Future <DetailsModel> getDetailsCurrencyDataFromApi(String id) async {
    try {
      print("entered get details currency data method");
      var response = await Dio().get(
          baseUrl+detailsAllCoinEndPoint+id);
      print(response.data);
      return  DetailsModel.fromJson(response.data);
    }  catch (e) {
      print(e);
      rethrow;
    }
  }



}

