import 'package:flutter/material.dart';
import 'package:vimatone/Core/Extras.dart';
import 'package:vimatone/View/Home.dart';
import 'package:vimatone/View/Reister/Register.dart';
import 'package:vimatone/widgets/CustomButton.dart';
import 'package:vimatone/widgets/CustomInput.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Extras.background,
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            height: 420,
            padding: EdgeInsets.all(Extras.padding_md),
            child: Column(
              children: [
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
                  height: 20,
                ),
                Custominput(
                  hintText: "Username",
                ),
                SizedBox(
                  height: 20,
                ),
                Custominput(
                  hintText: "Password",
                  obsecureText: true,
                  textInputType: TextInputType.visiblePassword,
                ),
                SizedBox(
                  height: 20,
                ),
                Custombutton(
                  text: "Sign In",
                  onPress: () {
                    Extras.routeTo(context, Home());
                  },
                ),
                SizedBox(
                  height: 10,
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
