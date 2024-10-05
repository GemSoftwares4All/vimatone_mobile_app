import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vimatone/Core/Extras.dart';
import 'package:vimatone/View/Base.dart';
import 'package:vimatone/View/Register.dart';
import 'package:vimatone/widgets/CustomButton.dart';
import 'package:vimatone/widgets/CustomInput.dart';

class Login extends StatelessWidget {
  const Login({super.key});
  final int _NavHeight = 150;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnnotatedRegion(
        value: SystemUiOverlayStyle(
          statusBarColor: Extras.background,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
        ),
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.all(Extras.padding_md),
              child: Column(
                children: [
                  SizedBox(
                    height: _NavHeight.toDouble(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "V",
                        style: TextStyle(
                          color: Extras.secondary,
                          fontWeight: FontWeight.bold,
                          fontSize: Extras.fontDiaplay_md,
                        ),
                      ),
                      Text(
                        "imatone",
                        style: TextStyle(
                          color: Extras.gray,
                          fontSize: Extras.fontTitle_lg,
                        ),
                      )
                    ],
                  ),
                  Text(
                    "Enter correct details to login.",
                    style: TextStyle(
                      color: Extras.gray,
                      fontSize: Extras.fontBody_sm,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Custominput(
                    hintText: "Username",
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Custominput(
                    hintText: "Password",
                    obsecureText: true,
                    textInputType: TextInputType.visiblePassword,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Custombutton(
                    text: "Sign In",
                    suffix_icon: Icon(
                      Icons.login_rounded,
                      color: Extras.primary,
                    ),
                    onPress: () {
                      Extras.routeTo(context, Index());
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Extras.routeTo(context, Register());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: TextStyle(
                            color: Extras.gray,
                            fontSize: Extras.fontBody_sm,
                          ),
                        ),
                        Text(
                          "Signup",
                          style: TextStyle(
                            color: Extras.secondary,
                            fontSize: Extras.fontBody_sm,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
