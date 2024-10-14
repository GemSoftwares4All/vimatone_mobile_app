import 'package:flutter/material.dart';
import 'package:vimatone/Config/Extras.dart';

class Apptextformfield extends StatelessWidget {
  final String hintText;
  final String label;
  final String errorText;
  final TextEditingController controller;
  final TextInputType keyboard;
  final Icon? prefixIcon;
  final bool obsecureText;
  final bool error;

  
  const Apptextformfield({
    super.key,
    required this.hintText,
    required this.label,
    required this.controller,
    required this.keyboard,
    this.prefixIcon,
    this.obsecureText = false, 
    this.error = false, 
    this.errorText = "",
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecureText,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        errorText: error ? errorText : null,
        label: Text(
          label,
          style: font_body.copyWith(color: color_gray),
        ),
      ),
    );
  }
}
