
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../view_model/providers/screens_providers/auth_provider/auth_provider.dart';
import '../../../view_model/providers/theme_provider/theme_provider.dart';
import 'login_screen.dart';



class RegisterScreen extends StatefulWidget {



  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var _email = TextEditingController();
  var _password = TextEditingController();
  var _name = TextEditingController();
  bool _isVisible =false;

  @override
  Widget build(BuildContext context) {
    Provider.of<ThemeProvider>(context,listen: false);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: TextFormField(
                        controller: _name,
                        validator: (value) {
                          if (value!.isEmpty || value.isNumericOnly) {
                            return "Please enter your name";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: Text('Name'),
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(keyboardType: TextInputType.emailAddress,
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
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(obscureText: _isVisible? false:true,
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
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green),
                        width: 650,
                        height: 50,
                        child: GestureDetector(
                         onTap: () {
                           if(_formKey.currentState!.validate()) {
                             Provider.of<AuthProvider>(context,listen: false).register(_name.text,_email.text, _password.text);
                           }
                         },
                         child: Center(child: Text('Sign Up', style: TextStyle(fontSize: 20))),
                        ),),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already have an account?'),
                        TextButton(
                          onPressed: () {
                            Get.to(LoginScreen());
                          },
                          child: Text('Sign in'),
                        ),
                      ],
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
