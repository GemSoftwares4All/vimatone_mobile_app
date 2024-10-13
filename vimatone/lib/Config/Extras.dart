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
    TextStyle(fontSize: 25.0, fontWeight: FontWeight.normal);
final TextStyle font_Logo1 =
    TextStyle(fontSize: 40.0, fontWeight: FontWeight.normal);
final TextStyle font_Logo2 =
    TextStyle(fontSize: 35.0, fontWeight: FontWeight.normal);

// colors
final Color color_primary = Color.fromRGBO(255, 255, 255, 1);
final Color color_background = Color.fromRGBO(247, 247, 247, 1);
final Color color_secondary = Color.fromRGBO(252, 185, 0, 1);
final Color color_tetiary = Color.fromRGBO(22, 28, 48, 1);
final Color color_dark = Color.fromRGBO(71, 71, 71, 1);
final Color color_gray = Color.fromRGBO(172, 172, 172, 1);
final Color color_error = Color.fromRGBO(255, 87, 87, 1);
final Color color_success = Color.fromRGBO(195, 255, 135, 1);
final Color color_transparent = Colors.transparent;

// constants
final String currency = "GH\$";
final String baseUrl = "https://vimatone.com/";
final String baseApiUrl = "https://vimatone.com/m_api";
final String API_KEY =
    "c4316f07b6c87e4aa6bfe8ee7adada86e364fe23d7a9cf8171b9bf8461c2ba85";
Map<String, dynamic> apiBody = {
  "m_name": "hacker",
  "m_id": "ua98hack21",
};
Map<String, String> apiHeaders = {
  "x-api-key":
      "c4316f07b6c87e4aa6bfe8ee7adada86e364fe23d7a9cf8171b9bf8461c2ba85",
  "Content-Type": "application/json",
  "Accept": "application/json"
};

List<String> explodeImages(String imgString) {
  return imgString.split("|");
}

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
