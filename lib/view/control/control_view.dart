
import 'package:crypto_currency/view/screens/in_app_screens/home_screen.dart';
import 'package:crypto_currency/view/widgets/bottom_navigation_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/providers/control_provider/control_provider.dart';
import '../screens/auth_screens/login_screen.dart';


class ControlView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ControlProvider>(builder: (context,provider,child){
      return provider.uId==null? LoginScreen() :BottomNavigationView();
    });
  }
}
