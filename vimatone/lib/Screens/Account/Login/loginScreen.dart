import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vimatone/Components/AppButton.dart';
import 'package:vimatone/Config/Extras.dart';
import 'package:vimatone/Providers/AuthProvider.dart';
import 'package:vimatone/Screens/Account/Login/widgets/appTextFormfield.dart';

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
                controller: usernameController,
                keyboard: TextInputType.text,
              ),
              spaceHeight_lg(),
              Apptextformfield(
                hintText: "Enter password",
                label: "Password",
                controller: passwordController,
                obsecureText: true,
                keyboard: TextInputType.visiblePassword,
              ),
              spaceHeight_lg(),
              AppButton(
                onTap: () async {
                  // remove delay and do login but remember to add
                  // await to login functionality
                  await Future.delayed(Duration(seconds: 3), () {
                    setState(() {
                      authProvider.toggleAuth();
                    });
                  });
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
