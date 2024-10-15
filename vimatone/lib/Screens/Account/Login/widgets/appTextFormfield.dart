import 'package:flutter/material.dart';
import 'package:vimatone/Config/Extras.dart';

class Apptextformfield extends StatefulWidget {
  final String hintText;
  final String label;
  final TextEditingController controller;
  final TextInputType keyboard;
  final Icon? prefixIcon;
  final String? errorText;
  final bool obsecureText;
  const Apptextformfield({
    super.key,
    required this.hintText,
    required this.label,
    required this.controller,
    required this.keyboard,
    this.prefixIcon,
    this.obsecureText = false,
    this.errorText,
  });

  @override
  State<Apptextformfield> createState() => _ApptextformfieldState();
}

class _ApptextformfieldState extends State<Apptextformfield> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.obsecureText,
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hintText,
        errorText: widget.errorText,
        label: Text(
          widget.label,
          style: font_body.copyWith(color: color_gray),
        ),
      ),
    );
  }
}
