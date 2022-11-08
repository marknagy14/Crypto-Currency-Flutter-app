
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_currency/view/widgets/bottom_navigation_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../models/user_model/user_model.dart';
import '../../../../view/screens/auth_screens/login_screen.dart';


class AuthProvider extends ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn();


  UserModel user = UserModel(name: "", email: "", image: "", userId: "");

  void logIn(String email, String password) async {
    try {

      await _auth.signInWithEmailAndPassword(email: email, password: password);
      setData(email, password);
      Get.offAll(()=>BottomNavigationView());

    } catch (e) {
      print(e);
      Get.snackbar("Login error account", e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red); // to show error message to user
    }
  }

  void logOut() async {
    try {

        await _googleSignIn.signOut();
        await _auth.signOut();

      Get.offAll(LoginScreen());
    } catch (e) {
      print(e);
    }
  }

  void register(String name, String email, String password) async {
    try {

      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        print(value);
        saveUser(value, name);
        setData(email, password);
        Get.offAll(()=>BottomNavigationView());
      });

    } catch (e) {
      print(e);
    }
  }

  void googleSignIn(email,password)async{
    try {

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      print(googleUser);
      GoogleSignInAuthentication googleSignInAuthentication=await googleUser!.authentication;
      final AuthCredential credential=GoogleAuthProvider.credential(accessToken: googleSignInAuthentication.accessToken,idToken:googleSignInAuthentication.idToken );
      await _auth.signInWithCredential(credential).then((value){
        saveUser(value, "");
        setData(email, password);
        Get.offAll(()=>BottomNavigationView());

      });


    }
    catch(e){
      print(e);
    }
  }



  void saveUser(UserCredential userCredential,String name)async{
    UserModel userModel = UserModel(
        name: name==""? userCredential.user!.displayName!: name, //if true means he signed in using google
        email: userCredential.user!.email!,
        image: "",
        userId: userCredential.user!
            .uid); //name is taken directly because we took it from textfromfield but the email and password are in firebase
    _firestore.collection("users").doc(userCredential.user!.uid).set(userModel.toJson());
  }

   Future getUser()async{
    await _firestore.collection("users").doc(_auth.currentUser!.uid).get().then((value)  {
      user=UserModel.fromJson(value.data()!);
      notifyListeners();
    });
  }

  setData(email,password)async{

    SharedPreferences preferences= await SharedPreferences.getInstance();
    preferences.setString("email", email.text);
    preferences.setString("password", password.text);
    print(preferences.getString("email"));
    print(preferences.getString("password"));

  }




}
