import 'package:crypto_currency/view/control/control_view.dart';
import 'package:crypto_currency/view_model/providers/control_provider/control_provider.dart';
import 'package:crypto_currency/view_model/providers/photo_provider/profile_photo_provider.dart';
import 'package:crypto_currency/view_model/providers/screens_providers/bottom_navigation_provider.dart';
import 'package:crypto_currency/view_model/providers/screens_providers/auth_provider/auth_provider.dart';
import 'package:crypto_currency/view_model/providers/screens_providers/details_screen_provider.dart';
import 'package:crypto_currency/view_model/providers/screens_providers/home_screen_provider.dart';
import 'package:crypto_currency/view_model/providers/screens_providers/search_screen_provider.dart';
import 'package:crypto_currency/view_model/providers/theme_provider/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

import 'core/themes.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => HomeScreenProvider()),
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ChangeNotifierProvider(create: (context) => DetailsScreenProvider()),
      ChangeNotifierProvider(create: (context) => SearchScreenProvider()),
      ChangeNotifierProvider(create: (context) => ControlProvider()),
      ChangeNotifierProvider(create: (context) => BottomNavigationProvider()),
      ChangeNotifierProvider(create: (context) => AuthProvider()),
      ChangeNotifierProvider(create: (context) => PhotoProvider())


    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Provider.of<ThemeProvider>(context, listen: false)
        .getThemeModeFromSharedPref();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,

      themeMode: Provider.of<ThemeProvider>(context).themeMode,
      //chooses between theme data(light or system or dark)

      home:ControlView(),
    );
  }
}
