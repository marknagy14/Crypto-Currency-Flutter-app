import 'package:crypto_currency/web_server/coin_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/screens_models/home_model.dart';
import '../../../web_server/dio_exceptions.dart';

class HomeScreenProvider extends ChangeNotifier {
  List<HomeModel> homeScreenList = [];

  HomeScreenProvider() {
    getCurrencyData();
  }

  void getCurrencyData() async {
    try {
      await CoinApi().getHomeCurrencyDataFromApi().then((value) {

        homeScreenList = value;
        notifyListeners(); //took list from api function and passed it to home screen list


      });

    } on DioError catch (e) {
      String error = DioExceptions.fromDioError(e).toString();
      //print(error);
      Get.dialog(AlertDialog(
        title: Text("error"),
        content: Text(error),
        actions: [
          TextButton(
              onPressed: () {
                getCurrencyData();
                Get.back(); //like pop
              },
              child: Text("try again"))
        ],
      ));
    }
  }
}


