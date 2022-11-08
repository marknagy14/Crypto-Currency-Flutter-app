import 'package:crypto_currency/view/widgets/list_builder.dart';
import 'package:crypto_currency/view_model/providers/screens_providers/details_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../core/themes.dart';
import '../../../view_model/providers/screens_providers/search_screen_provider.dart';
import '../../../view_model/providers/theme_provider/theme_provider.dart';


class SearchScreen extends StatelessWidget {
  bool tapped = false;
  var _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Provider.of<ThemeProvider>(context, listen: false);
    Provider.of<DetailsScreenProvider>(context, listen: false);
    var provider=Provider.of<SearchScreenProvider>(context, listen: false);

    return Consumer<SearchScreenProvider>(builder: (context, provider1, child) {
      return Scaffold(
          appBar: AppBar(
            title: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(5)),
              child: TextField(
                controller: _controller,
                onChanged: (value) {
                  // called everytime you type a letter
                  tapped = true;
                  provider1.getCurrencyData(value);
                },
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          _controller.clear();
                          createSvgImage();
                        },
                        icon: Icon(Icons.clear)),
                    filled: true,
                    fillColor: Themes.isDarkMode(context)
                        ? Colors.blueGrey
                        : Colors.white,
                    hintText: 'search',
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search)),
              ),
            ),
          ),
          body: (tapped == false)
          ? createSvgImage()
          : ((provider.searchScreenList.length == 0))
          ? createSvgImage()
              : Consumer<SearchScreenProvider>(
                  builder: (context, provider, child) {
                  return ListBuilder.searchScreen(searchProvider: provider).search_screen_list();

                }));
    });
  }

  Widget createSvgImage(){
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
}
