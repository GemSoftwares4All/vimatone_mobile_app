import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vimatone/Components/AppButton.dart';
import 'package:vimatone/Config/Extras.dart';
import 'package:vimatone/Providers/AuthProvider.dart';
import 'package:vimatone/Providers/UserProvider.dart';
import 'package:vimatone/Screens/Account/Login/widgets/appTextFormfield.dart';
import 'package:vimatone/Services/LoginService.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _passwdError = null;
  var _emailError = null;
  final loginService = LoginService();

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    final authProvider = Provider.of<AuthProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color_background,
      ),
      body: SingleChildScrollView(
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
              Column(
                children: [
                  Apptextformfield(
                    hintText: "Enter email address",
                    label: "Email address",
                    controller: emailController,
                    keyboard: TextInputType.emailAddress,
                    errorText: _emailError,
                  ),
                  spaceHeight_lg(),
                  Apptextformfield(
                    hintText: "Enter password",
                    label: "Password",
                    controller: passwordController,
                    errorText: _passwdError,
                    obsecureText: true,
                    keyboard: TextInputType.visiblePassword,
                  ),
                ],
              ),
              spaceHeight_lg(),
              AppButton(
                onTap: () async {
                  setState(() {
                    _passwdError = null;
                    _emailError = null;
                  });
                  Map _response = await loginService.Login(
                    emailController.text,
                    passwordController.text,
                  );
                  if (_response["status"] != 200) {
                    Map _data = _response["data"];
                    if (_data.containsKey("password")) {
                      setState(() {
                        _passwdError = _data["password"];
                      });
                    }
                    if (_data.containsKey("email")) {
                      setState(() {
                        _emailError = _data["email"];
                      });
                    }
                  }
                  print(_response);
                  setState(() {
                    authProvider.setAuth(true);
                    userProvider.setUser(_response["data"]);
                  });
                  print(userProvider.CurrentUser);
                  // showDialog(context: context, builder: (context) {

                  // });
                },
                items: [
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
