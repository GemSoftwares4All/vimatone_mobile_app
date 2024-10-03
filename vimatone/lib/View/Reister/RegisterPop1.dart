import 'package:flutter/material.dart';
import 'package:vimatone/Core/Extras.dart';
import 'package:vimatone/View/Home.dart';
import 'package:vimatone/View/Login.dart';
import 'package:vimatone/widgets/CustomButton.dart';
import 'package:vimatone/widgets/CustomInput.dart';

class RegisterPop1 extends StatelessWidget {
  const RegisterPop1({super.key});

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
                    Icon(
                      Icons.check_circle,
                      color: Extras.secondary,
                    ),
                    Container(
                      width: 50,
                      height: 8,
                      color: Extras.secondary,
                    ),
                    Icon(
                      Icons.check_circle,
                      color: Extras.secondary,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Custominput(
                  hintText: "Phone",
                  textInputType: TextInputType.phone,
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
                  text: "Sign Up",
                  onPress: () {
                    Extras.routeTo(context, Home());
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Extras.routeTo(context, Login());
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
    );
  }
}
