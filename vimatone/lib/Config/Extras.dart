import 'package:flutter/material.dart';

// padding
const padding_sm = 10.0;
const padding_md = 15.0;
const padding_lg = 25.0;

// radius
const radius_sm = 5.0;
const radius_md = 10.0;
const radius_lg = 15.0;

// height spacer
Widget spaceHeight_sm() {
  return SizedBox(
    height: padding_sm,
  );
}

Widget spaceHeight_md() {
  return SizedBox(
    height: padding_md,
  );
}

Widget spaceHeight_lg() {
  return SizedBox(
    height: padding_lg,
  );
}

// width spacer
Widget spaceWidth_sm() {
  return SizedBox(
    width: padding_sm,
  );
}

Widget spaceWidth_md() {
  return SizedBox(
    width: padding_md,
  );
}

Widget spaceWidth_lg() {
  return SizedBox(
    width: padding_lg,
  );
}

// sizes
const size_tiny = 12.0;
const size_sm = 15.0;
const size_md = 20.0;
const size_lg = 25.0;
const size_xlg = 30.0;

// text font
final TextStyle font_tiny =
    const TextStyle(fontSize: 10.0, fontWeight: FontWeight.normal);
final TextStyle font_body =
    const TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal);
final TextStyle font_body_title =
    const TextStyle(fontSize: 17.5, fontWeight: FontWeight.normal);
final TextStyle font_subtitle =
    const TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal);
final TextStyle font_title =
    const TextStyle(fontSize: 25.0, fontWeight: FontWeight.normal);

// colors
final Color color_primary = const Color.fromRGBO(255, 255, 255, 1);
final Color color_background = const Color.fromRGBO(247, 247, 247, 1);
final Color color_secondary = const Color.fromRGBO(252, 185, 0, 1);
final Color color_tetiary = const Color.fromRGBO(22, 28, 48, 1);
final Color color_gray = const Color.fromRGBO(172, 172, 172, 1);
final Color color_error = const Color.fromRGBO(255, 87, 87, 1);
const Color color_transparent = Colors.transparent;

// constants
const String currency = "GH\$";

  // void routeTo(BuildContext context, Widget destination,
  //     {bool FullScreenDialog = false}) {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       fullscreenDialog: FullScreenDialog,
  //       builder: (context) => destination,
  //     ),
  //   );
  // }
