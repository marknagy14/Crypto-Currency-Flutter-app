import 'package:crypto_currency/core/themes.dart';
import 'package:crypto_currency/view_model/providers/screens_providers/details_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

//import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../core/constants.dart';
import '../../../view_model/providers/theme_provider/theme_provider.dart';

class DetailsScreen extends StatelessWidget {
  String id;

  DetailsScreen({required this.id});

  @override
  Widget build(BuildContext context) {
    var provider1 = Provider.of<DetailsScreenProvider>(context);
    Provider.of<ThemeProvider>(context, listen: false);

    var data = [
      ChartData("24H", provider1.coinDetails.percentageChange24h),
      ChartData("1W", provider1.coinDetails.percentageChange7d),
      ChartData("2W", provider1.coinDetails.percentageChange14d),
      ChartData("1M", provider1.coinDetails.percentageChange30d),
      ChartData("2M", provider1.coinDetails.percentageChange60d),
      ChartData("6M", provider1.coinDetails.percentageChange200d),
      ChartData("1Y", provider1.coinDetails.percentageChange1y),
    ];

    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Themes.isDarkMode(context) ? Colors.white : Colors.black,
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Container(
                      height: 300,
                      width: 500,
                      child: provider1.coinDetails.imageUrl == ''
                          ? Image.asset("assets/loadingImage.gif")
                          : Image.network(
                              provider1.coinDetails.imageUrl.toString())),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        provider1.coinDetails.name,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Rank",
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey,
                            ),
                            child: Center(
                                child: Text(
                                    provider1.coinDetails.rank.toString())),
                          )
                        ],
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    provider1.coinDetails.symbol,
                    style: TextStyle(color: Colors.white38),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text("Price",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("\$"+provider1.coinDetails.currentPrice.toString(),
                          style: TextStyle(fontSize: 18)),
                      SizedBox(width: 10),
                      Text(
                        provider1.coinDetails.percentageChange24h > 0
                            ? "+" +
                                provider1.coinDetails.percentageChange24h
                                    .toString() +
                                "%"
                            : "-" +
                                provider1.coinDetails.percentageChange24h
                                    .toString() +
                                "%",
                        style: TextStyle(
                            color:
                                (provider1.coinDetails.percentageChange24h) > 0
                                    ? Colors.green
                                    : Colors.red),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Themes.isDarkMode(context)
                              ? listColor
                              : Colors.white60,
                        ),
                        child: buildCurve(data)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Description",
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Html(
                    data: provider1.coinDetails.description,
                  )
                ]))));
  }
}

class ChartData {
  String x;
  double y;

  ChartData(this.x, this.y);
}

Widget buildCurve(data) {
  return SfCartesianChart(
      primaryXAxis: CategoryAxis(
        isVisible: true,
        majorGridLines: MajorGridLines(width: 1),
        axisLine: AxisLine(width: 3, color: Colors.white),
        labelStyle: TextStyle(color: Colors.white, fontSize: 20),
        majorTickLines: MajorTickLines(size: 0),
      ),
      primaryYAxis: CategoryAxis(isVisible: false),
      series: <ChartSeries<ChartData, String>>[
        LineSeries(
            dataLabelSettings: DataLabelSettings(
              isVisible: true,
            ),
            color: Colors.green,
            width: 3,
            dataSource: data,
            xValueMapper: (ChartData sales, _) => sales.x.toString(),
            yValueMapper: (ChartData sales, _) => sales.y)
      ]);
}
