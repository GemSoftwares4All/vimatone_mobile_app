import 'package:flutter/material.dart';
import 'package:vimatone/Core/Extras.dart';

class Custominput extends StatelessWidget {
  final String hintText;
  final String? errorText;
  final bool obsecureText;
  final TextInputType textInputType;
  const Custominput({
    super.key,
    required this.hintText,
    this.obsecureText = false,
    this.errorText,
    this.textInputType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      decoration: InputDecoration(hintText: hintText, errorText: errorText),
      obscureText: obsecureText,
      style: TextStyle(fontSize: Extras.fontBody_md, color: Extras.text),
    );
  }
}
