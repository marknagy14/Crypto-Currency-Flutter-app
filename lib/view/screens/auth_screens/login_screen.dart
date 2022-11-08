import 'package:crypto_currency/view/screens/auth_screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../view_model/providers/screens_providers/auth_provider/auth_provider.dart';
import '../../../view_model/providers/theme_provider/theme_provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
    var _email = TextEditingController();

    var _password = TextEditingController();

   GlobalKey<FormState> _formKey = GlobalKey<FormState>();

   bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    Provider.of<ThemeProvider>(context,listen: false);
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FocusScope(autofocus: true,
          child: Form(
            key: _formKey,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Sign in",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: TextFormField(keyboardType: TextInputType.emailAddress,
                        controller: _email,
                        validator: (value) {
                          if (value!.isEmpty || !value.contains("@")) {
                            return "Please enter your email";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: Text('Email'),
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: TextFormField(obscureText: _isVisible ? false : true,
                        controller: _password,
                        validator: (value) {
                          if (value!.isEmpty || value.length < 3) {
                            return "Please enter your password";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: 'Enter Password',
                            label: Text('Password'),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isVisible = !_isVisible;
                                  });
                                },
                                icon: Icon(_isVisible
                                    ? Icons.visibility_off
                                    : Icons.remove_red_eye))),
                      ),
                    ),

                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            Provider.of<AuthProvider>(context, listen: false)
                                .logIn(_email.text, _password.text);
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.green),
                          width: 650,
                          height: 50,
                          child: Center(
                              child: Text(
                            'Sign in',
                            style: TextStyle(fontSize: 20),
                          )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Or",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                        onTap: () {

                          Provider.of<AuthProvider>(context, listen: false)
                              .googleSignIn(_email,_password);

                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 850,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/google.png',
                                  height: 20,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text('continue with google'),
                              ],
                            ),
                          ),
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Don\'t have an account?'),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => RegisterScreen(
                                )));
                          },
                          child: Text('Sign Up'),
                        ),
                      ],
                    ),
                    // Sign in with google logo
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }


}
