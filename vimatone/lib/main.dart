import 'package:flutter/material.dart';
import 'package:vimatone/Core/AppTheme.dart';
// import 'package:vimatone/View/BasePage.dart';
import 'package:vimatone/View/Login.dart';

void main() {
  runApp(const Vimatone());
}

class Vimatone extends StatelessWidget {
  const Vimatone({super.key});

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vimatone',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light_theme,
      home: Login(),
    );
  }
}
