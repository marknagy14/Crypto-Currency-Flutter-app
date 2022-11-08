
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../core/constants.dart';
import '../../../core/themes.dart';
import '../../../view_model/providers/photo_provider/profile_photo_provider.dart';
import '../../../view_model/providers/screens_providers/auth_provider/auth_provider.dart';
import '../../../view_model/providers/theme_provider/theme_provider.dart';

class PhotoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var themeProvider= Provider.of<ThemeProvider>(context,listen: false);
    var provider=Provider.of<PhotoProvider>(context);
    Provider.of<AuthProvider>(context,listen: false).getUser();

    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Center(
          child: Column(
            children: [
              CircleAvatar(
                  backgroundImage: NetworkImage(Provider.of<AuthProvider>(
                                  context)
                              .user
                              .image ==
                          ""
                      ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR44BB-HA1VgWJH62Z0ioklORrEN64b3n7Miygw_N5vIg&s"
                      : Provider.of<AuthProvider>(context).user.image),
                  radius: 70),
              SizedBox(
                height: 5,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    child: Align(
                      child: Column(
                        children: [
                          Text(
                            Provider.of<AuthProvider>(context).user.name,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text(Provider.of<AuthProvider>(context).user.email),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary:Themes.checkAndSetButtonColor(context)),
                                  onPressed: () {
                                    provider.getImage(ImageSource.gallery);
                                  },
                                  child: Row(
                                    children: [
                                      Text(
                                        "From Gallery",
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      SizedBox(
                                        width: 2,
                                      ),
                                      Icon(Icons.photo)
                                    ],
                                  )),SizedBox(width: 3,),
                              Expanded(
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary:Themes.checkAndSetButtonColor(context)),
                                    onPressed: () {
                                      provider.getImage(ImageSource.camera);
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          "Take a Picture",
                                          style: TextStyle(fontSize: 15),
                                        ),
                                        SizedBox(
                                          width: 2,
                                        ),
                                        Icon(Icons.camera_alt)
                                      ],
                                    )),
                              ),

                            ],
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary:Themes.checkAndSetButtonColor(context)),
                              onPressed: () {
                                showTheDialog(context,themeProvider);
                              },
                              child: Row(
                                children: [
                                  Text("Change Theme"),
                                  Icon(Icons.arrow_drop_down_outlined)
                                ],
                              )),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary:Themes.checkAndSetButtonColor(context)),
                              onPressed: () {
                                Provider.of<AuthProvider>(context, listen: false)
                                    .logOut();
                              },
                              child: Row(
                                children: [Text("Log Out"), Icon(Icons.logout)],
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }

Future<dynamic> showTheDialog(context,themeProvider){
  return showDialog(

  builder: (context) {
  return AlertDialog(
  content: Container(height: 200,width: 200,
    child: Center(
      child: Column(children: [
        ElevatedButton(onPressed: (){
          themeProvider.saveThemeModeToSharedPref(ThemeMode.system);
        }, child: Text("System"),style: ElevatedButton.styleFrom(primary: listColor),),SizedBox(height: 10,),
        ElevatedButton(onPressed: (){
          themeProvider.saveThemeModeToSharedPref(ThemeMode.dark);
        }, child: Text("Dark"),style: ElevatedButton.styleFrom(primary: listColor),),SizedBox(height: 10,),
        ElevatedButton(onPressed: (){
          themeProvider.saveThemeModeToSharedPref(ThemeMode.light);
        }, child: Text("Light"),style: ElevatedButton.styleFrom(primary: Colors.white38),)


      ],),
    ),
  )
  );
  }, context: context);}




}
