import 'package:flutter/material.dart';
import 'package:vimatone/Core/Extras.dart';

class Custombutton extends StatelessWidget {
  final String text;
  final VoidCallback onPress;
  final Widget? suffix_icon;
  const Custombutton({
    super.key,
    required this.text,
    required this.onPress,
    this.suffix_icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
              color: Extras.background,
              fontSize: Extras.fontBody_md,
            ),
          ),
          SizedBox(
            width: Extras.padding_md,
          ),
          Container(
            child: suffix_icon,
          ),
        ],
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
