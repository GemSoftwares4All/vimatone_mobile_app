import 'package:flutter/material.dart';
import 'package:vimatone/Config/Extras.dart';

class Apptextformfield extends StatelessWidget {
  final String hintText;
  final String label;
  final TextEditingController controller;
  final TextInputType keyboard;
  final Icon? prefixIcon;
  final bool obsecureText;
  const Apptextformfield({
    super.key,
    required this.hintText,
    required this.label,
    required this.controller,
    required this.keyboard,
    this.prefixIcon,
    this.obsecureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecureText,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        label: Text(
          label,
          style: font_body.copyWith(color: color_gray),
        ),
      ),
    );
  }
}
