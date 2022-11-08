import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../core/themes.dart';
import '../../view_model/providers/screens_providers/details_screen_provider.dart';


class ListBuilder{

  var searchProvider;
  var homeProvider;



  ListBuilder.searchScreen({required this.searchProvider}){

  }

  ListBuilder.homeScreen({required this.homeProvider}){

  }


  Widget search_screen_list(){

    return ListView.builder(
        itemCount: searchProvider.searchScreenList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Provider.of<DetailsScreenProvider>(context,
                  listen: false)
                  .getCurrencyData(
                  searchProvider.searchScreenList[index].id);
            },
            child: Container(
              child: Card(
                elevation: 20.0,
                color: Themes.isDarkMode(context)
                    ? Color(0xff151f2c)
                    : Colors.blueGrey,
                child: Row(children: [
                  Container(
                    height:
                    MediaQuery.of(context).size.height * 0.1,
                    width:
                    MediaQuery.of(context).size.width * 0.1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: CircleAvatar(
                        radius: 5.0,
                        child: Image.network(searchProvider
                            .searchScreenList[index].imageUrl)),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Text(
                            searchProvider.searchScreenList[index].name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Text(
                            searchProvider
                                .searchScreenList[index].symbol,
                          )
                        ]),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Column(
                          mainAxisAlignment:
                          MainAxisAlignment.start,
                          crossAxisAlignment:
                          CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Rank",
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              searchProvider
                                  .searchScreenList[index].rank
                                  .toString(),
                              maxLines: 1,
                              softWrap: false,
                              overflow: TextOverflow.visible,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ]),
              ),
            ),
          );
        });

  }

  Widget home_screen_list(dProvider){
    return ListView.builder(
        itemCount: homeProvider.homeScreenList.length,
        itemBuilder: (context, index) {
          return GestureDetector(onTap:(){
            dProvider.getCurrencyData(homeProvider.homeScreenList[index].id);
          } ,
            child: Container(
              child: Card(
                color: Themes.checkAndSetTileColor(context),
                child: Row(children: [
                  Text(
                    homeProvider.homeScreenList[index].rank.toString(),
                    style: TextStyle(fontSize: 20 ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: CircleAvatar(backgroundColor: Colors.transparent,
                        radius: 5.0,
                        child: Image.network(
                            homeProvider.homeScreenList[index].imageUrl)),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            homeProvider.homeScreenList[index].name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Text(
                            homeProvider.homeScreenList[index].symbol,

                          )
                        ]),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            homeProvider.homeScreenList[index].currentPrice
                                .toString() +
                                "\$",
                            maxLines: 1,
                            softWrap: false,
                            overflow: TextOverflow.visible,
                            style: TextStyle(
                                fontSize: 14),
                          ),
                          Text(
                            homeProvider.homeScreenList[index].priceChange24h >
                                0
                                ? "+" +
                                homeProvider.homeScreenList[index]
                                    .priceChange24h
                                    .toString() +
                                "\$"
                                : "-" +
                                homeProvider.homeScreenList[index]
                                    .priceChange24h
                                    .toStringAsPrecision(12)
                                    .toString() +
                                "\$",
                            overflow: TextOverflow.visible,
                            maxLines: 1,
                            softWrap: false,
                            style: TextStyle(
                                fontSize: 12,
                                color: homeProvider.homeScreenList[index]
                                    .priceChange24h >
                                    0
                                    ? Colors.green
                                    : Colors.red),
                          ),
                          Text(
                            homeProvider.homeScreenList[index].priceChangePercentage24h >
                                0
                                ? "+" +
                                homeProvider.homeScreenList[index]
                                    .priceChangePercentage24h
                                    .toString() +
                                "%"
                                : "-" +
                                homeProvider.homeScreenList[index]
                                    .priceChangePercentage24h

                                    .toString() +
                                "%",
                            overflow: TextOverflow.visible,
                            maxLines: 1,
                            softWrap: false,
                            style: TextStyle(
                                fontSize: 12,
                                color: homeProvider.homeScreenList[index]
                                    .priceChangePercentage24h>
                                    0
                                    ? Colors.green
                                    : Colors.red),
                          )
                        ],
                      ),
                    ),
                  )
                ]),
              ),
            ),
          );
        });

  }
  Widget svgImage(){
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
                height: 200, width: 200, "assets/search.svg"),
            SizedBox(
              height: 10,
            ),
            Text(
              "search for a coin",
              style:
              TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            )
          ],
        ));
  }


  Widget check_and_set_currency_sign_percentage(double value,index){
    return Text(
      homeProvider.homeScreenList[index]. priceChangePercentage24h >
          0
          ? "+" +
          homeProvider.homeScreenList[index]
              . priceChangePercentage24h
              .toString() +
          "%"
          : "-" +
          homeProvider.homeScreenList[index]
              . priceChangePercentage24h

              .toString() +
          "%",
      overflow: TextOverflow.visible,
      maxLines: 1,
      softWrap: false,
      style: TextStyle(
          fontSize: 12,
          color: homeProvider.homeScreenList[index]
              .priceChangePercentage24h>
              0
              ? Colors.green
              : Colors.red),
    );

  }

  Widget check_and_set_currency_sign_change(double value,index){
    return Text(
      homeProvider.homeScreenList[index].priceChange24h>
          0
          ? "+" +
          homeProvider.homeScreenList[index]
              . priceChange24h
              .toString() +
          "%"
          : "-" +
          homeProvider.homeScreenList[index]
              . priceChange24h

              .toString() +
          "%",
      overflow: TextOverflow.visible,
      maxLines: 1,
      softWrap: false,
      style: TextStyle(
          fontSize: 12,
          color: homeProvider.homeScreenList[index]
              .priceChange24h>
              0
              ? Colors.green
              : Colors.red),
    );

  }




}