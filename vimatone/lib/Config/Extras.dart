import 'package:flutter/material.dart';

// padding
final padding_sm = 10.0;
final padding_md = 15.0;
final padding_lg = 25.0;

// radius
final radius_sm = 5.0;
final radius_md = 10.0;
final radius_lg = 15.0;

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
final size_tiny = 12.0;
final size_sm = 15.0;
final size_md = 20.0;
final size_lg = 25.0;
final size_xlg = 30.0;

// text font
final TextStyle font_tiny =
    TextStyle(fontSize: 10.0, fontWeight: FontWeight.normal);
final TextStyle font_body =
    TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal);
final TextStyle font_body_title =
    TextStyle(fontSize: 17.5, fontWeight: FontWeight.normal);
final TextStyle font_subtitle =
    TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal);
final TextStyle font_title =
    TextStyle(fontSize: 25.0, fontWeight: FontWeight.normal);

// colors
final Color color_primary = Color.fromRGBO(255, 255, 255, 1);
final Color color_background = Color.fromRGBO(247, 247, 247, 1);
final Color color_secondary = Color.fromRGBO(252, 185, 0, 1);
final Color color_tetiary = Color.fromRGBO(22, 28, 48, 1);
final Color color_gray = Color.fromRGBO(172, 172, 172, 1);
final Color color_error = Color.fromRGBO(255, 87, 87, 1);
final Color color_transparent = Colors.transparent;

// constants
final String currency = "GH\$";

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
