import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vimatone/Components/AppButton.dart';
import 'package:vimatone/Config/Extras.dart';
import 'package:vimatone/Providers/AuthProvider.dart';
import 'package:vimatone/Screens/Account/Login/widgets/appTextFormfield.dart';
import 'package:vimatone/Services/LoginService.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {

    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final authProvider = Provider.of<AuthProvider>(context);

    String? emailError = "";
    String? passwordError = "";
    bool isLoading = false;
    bool error = false;

    Future<void> _performLogin() async {
      print("Loging");
      setState(() {
        isLoading = true;
      });

      String email = usernameController.text;
      String password = passwordController.text;

      try{

        var _logResp = await LoginService().sendInfo(email, password);

        if(_logResp["status"] == 200 ){
          
          var userData = _logResp["data"];
          SharedPreferences prefs = await SharedPreferences.getInstance();
          String userJson = jsonEncode(userData);
          await prefs.setString("userInfo", userJson);
          await prefs.setBool("isLoggedIn", true);

          // Send to the Account Page
          error = false;
          isLoading = false;
          Navigator.pushNamed(context, "/");

        } else{
          error = true;
          emailError = _logResp["data"]["email"];
          passwordError = _logResp["data"]["password"];

        }

      } catch(e){
        setState(() {
          error = true;
          isLoading = false;
          passwordError = "Error";
          emailError = "Error";
        });
        print("An Error Occured");
      }

    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color_background,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(padding_md),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "V",
                    style: font_Logo1.copyWith(
                      color: color_secondary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "imatone",
                    style: font_Logo2.copyWith(color: color_gray),
                  )
                ],
              ),
              Text(
                "Enter correct details to login.",
                style: font_body.copyWith(
                  color: color_gray,
                ),
              ),
              spaceHeight_lg(),
              Apptextformfield(
                hintText: "Enter username",
                label: "Username",
                errorText: "$emailError",
                error: error,
                controller: usernameController,
                keyboard: TextInputType.text,
              ),
              spaceHeight_lg(),
              Apptextformfield(
                hintText: "Enter password",
                label: "Password",
                error: error,
                errorText: "$passwordError",
                controller: passwordController,
                obsecureText: true,
                keyboard: TextInputType.visiblePassword,
              ),
              spaceHeight_lg(),
              AppButton(
                onTap: () async {
                  _performLogin();
                  
                  // remove delay and do login but remember to add
                  // await to login functionality
                  // await Future.delayed(Duration(seconds: 3), () {
                  //   setState(() {
                  //     authProvider.toggleAuth();
                  //   });
                  // });
                },
                items: [
                  isLoading ? CircularProgressIndicator.adaptive() : 
                  Text(
                    "Login",
                    style: font_body_title.copyWith(color: color_primary),
                  ),
                ],
              ),
              spaceHeight_md(),
              GestureDetector(
                onTap: () {
                  // goto register on website
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: font_body.copyWith(
                        color: color_gray,
                      ),
                    ),
                    Text(
                      "Signup",
                      style: font_body.copyWith(
                        color: color_secondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
