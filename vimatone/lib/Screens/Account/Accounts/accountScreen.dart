// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:vimatone/Services/CategoryService.dart';

class Accountscreen extends StatefulWidget {
  const Accountscreen({super.key});

  @override
  State<Accountscreen> createState() => _AccountscreenState();
}

class _AccountscreenState extends State<Accountscreen> {
  bool logedIn = false;

  @override
  Widget build(BuildContext context) {
    final categoryService = CategoryService();
    return Center(
      child: ElevatedButton(
        onPressed: () async {
          var data = await categoryService.getCategory();
          print(data);
        },
        child: logedIn ? Container(
          child: Text("Loged In"),
        ) : Container(
          child: Text("Not Logged I"),
        ),
      ),
    );
  }
}
