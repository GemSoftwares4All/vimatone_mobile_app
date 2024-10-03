import 'package:flutter/material.dart';
import 'package:vimatone/Core/Extras.dart';
import 'package:vimatone/View/Login.dart';
import 'package:vimatone/View/Reister/RegisterPop1.dart';
import 'package:vimatone/widgets/CustomButton.dart';
import 'package:vimatone/widgets/CustomInput.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Extras.background,
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            height: 450,
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
                  "Enter correct details to signup.",
                  style: TextStyle(
                    color: Extras.gray,
                    fontSize: Extras.fontBody_sm,
                  ),
                ),
                SizedBox(
                  height: 5,
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
                  height: 5,
                ),
                Custominput(
                  hintText: "Username",
                  textInputType: TextInputType.text,
                ),
                SizedBox(
                  height: 20,
                ),
                Custominput(
                  hintText: "Email",
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 20,
                ),
                Custombutton(
                  text: "Next",
                  onPress: () {
                    Extras.routeTo(context, RegisterPop1());
                  },
                ),
                SizedBox(
                  height: 10,
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
    );
  }
}
