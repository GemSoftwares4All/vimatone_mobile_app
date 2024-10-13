import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vimatone/Providers/AuthProvider.dart';
import 'package:vimatone/Screens/Account/Accounts/accountScreen.dart';
import 'package:vimatone/Screens/Account/Login/loginScreen.dart';

class Accountbase extends StatefulWidget {
  const Accountbase({super.key});

  @override
  State<Accountbase> createState() => _AccountbaseState();
}

class _AccountbaseState extends State<Accountbase> {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    print(authProvider.isAuthorized);
    return authProvider.isAuthorized ? Accountscreen() : LoginScreen();
  }
}
