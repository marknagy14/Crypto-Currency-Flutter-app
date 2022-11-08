import 'package:crypto_currency/view/screens/in_app_screens/details_screen.dart';
import 'package:crypto_currency/view/widgets/list_builder.dart';
import 'package:crypto_currency/view_model/providers/theme_provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

import '../../../core/themes.dart';
import '../../../view_model/providers/screens_providers/auth_provider/auth_provider.dart';
import '../../../view_model/providers/screens_providers/details_screen_provider.dart';
import '../../../view_model/providers/screens_providers/home_screen_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     Provider.of<ThemeProvider>(context,listen: false);
    var dProvider=Provider.of<DetailsScreenProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Crypto currency",
          style: TextStyle(fontSize: 20),
        ),

      ),
      body: Consumer<HomeScreenProvider>(
        builder: (context, provider, child) {
        return  ListBuilder.homeScreen(homeProvider: provider).home_screen_list(dProvider);
        },
      ),
    );
  }
}
