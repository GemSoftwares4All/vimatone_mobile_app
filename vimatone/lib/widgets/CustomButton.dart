import 'package:flutter/material.dart';
import 'package:vimatone/Core/Extras.dart';

class Custombutton extends StatelessWidget {
  final String text;
  final VoidCallback onPress;
  const Custombutton({
    super.key,
    required this.text,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress,
      child: Text(
        text,
        style: TextStyle(
          color: Extras.background,
          fontSize: Extras.fontBody_md,
        ),
      ),
      style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Extras.tetiary),
          padding: WidgetStatePropertyAll(
            EdgeInsets.symmetric(vertical: Extras.padding_md),
          ),
          surfaceTintColor: WidgetStatePropertyAll(Extras.background),
          minimumSize: WidgetStatePropertyAll(
            Size(double.maxFinite, 0),
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                Extras.radius_md,
              ),
            ),
          )),
    );
  }
}
