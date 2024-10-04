import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vimatone/Core/Extras.dart';
import 'package:vimatone/View/Index.dart';
import 'package:vimatone/View/Login.dart';
import 'package:vimatone/widgets/CustomButton.dart';
import 'package:vimatone/widgets/CustomInput.dart';

class Register extends StatelessWidget {
  const Register({super.key});
  final int _NavHeight = 100;
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
          appBar: AppBar(
            backgroundColor: Extras.background,
            foregroundColor: Extras.tetiary,
            scrolledUnderElevation: 0,
          ),
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height - _NavHeight,
              padding: EdgeInsets.all(Extras.padding_md),
              child: Column(
                children: [
                  // SizedBox(
                  //   height: _NavHeight.toDouble(),
                  // ),
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
                    "Enter correct details to signup.",
                    style: TextStyle(
                      color: Extras.gray,
                      fontSize: Extras.fontBody_sm,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: Extras.secondary,
                      ),
                      Container(
                        width: 50,
                        height: 8,
                        color: Extras.secondary,
                      ),
                      Icon(Icons.check_circle_outline_outlined),
                      Container(
                        width: 50,
                        height: 8,
                        color: Extras.gray,
                      ),
                      Icon(Icons.check_circle_outline_outlined),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Custominput(
                    hintText: "Username",
                    textInputType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Custominput(
                    hintText: "Email",
                    textInputType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Custominput(
                    hintText: "Phone",
                    textInputType: TextInputType.phone,
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
                    text: "Sign Up",
                    suffix_icon: Icon(
                      Icons.chevron_right_rounded,
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Login(),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: TextStyle(
                            color: Extras.gray,
                            fontSize: Extras.fontBody_sm,
                          ),
                        ),
                        Text(
                          "Sign In",
                          style: TextStyle(
                            color: Extras.secondary,
                            fontSize: Extras.fontBody_sm,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
