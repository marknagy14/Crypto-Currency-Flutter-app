import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../models/screens_models/details_model.dart';
import '../../../view/screens/in_app_screens/details_screen.dart';
import '../../../web_server/coin_api.dart';
import '../../../web_server/dio_exceptions.dart';

class DetailsScreenProvider extends ChangeNotifier {
  DetailsModel coinDetails = DetailsModel(
      id: "",
      name: "",
      symbol: "",
      description: "",
      rank: 0,
      imageUrl: "",
      currentPrice: 0.0,
      percentageChange24h: 0,
      percentageChange7d:0,
      percentageChange14d: 0,
      percentageChange30d: 0,
      percentageChange60d: 0,
      percentageChange200d: 0,
      percentageChange1y: 0);

  void getCurrencyData(String id) async {
    try {
      await CoinApi().getDetailsCurrencyDataFromApi(id).then((value) {
        coinDetails = value;
        //took list from api function and passed it to home screen list
        notifyListeners();
      });
      Get.to(DetailsScreen(id:id));

    } on DioError catch (e) {
      String error = DioExceptions.fromDioError(e).toString();
      //print(error);
    }
  }
}
