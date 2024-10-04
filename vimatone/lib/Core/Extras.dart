import 'package:flutter/material.dart';

class Extras {
  // padding
  static final padding_sm = 10.0;
  static final padding_md = 15.0;
  static final padding_lg = 25.0;

  // margin
  static final margin_sm = 10.0;
  static final margin_md = 15.0;
  static final margin_lg = 25.0;

  // radius
  static final radius_sm = 10.0;
  static final radius_md = 15.0;
  static final radius_lg = 25.0;

  // font display
  static final fontDiaplay_sm = 40.0;
  static final fontDiaplay_md = 45.0;
  static final fontDiaplay_lg = 50.0;

  // font tile
  static final fontTitle_sm = 27.0;
  static final fontTitle_md = 30.0;
  static final fontTitle_lg = 35.0;

  // font body
  static final fontBody_sm = 15.0;
  static final fontBody_md = 20.0;
  static final fontBody_lg = 25.0;

  // fontWeight
  static final fontWeight_sm = 10.0;
  static final fontWeight_md = 15.0;
  static final fontWeight_lg = 25.0;

  // colors
  static final Color primary = Color.fromRGBO(255, 255, 255, 1);
  static final Color background = Color.fromRGBO(247, 247, 247, 1);
  static final Color secondary = Color.fromRGBO(252, 185, 0, 1);
  static final Color tetiary = Color.fromRGBO(22, 28, 48, 1);
  static final Color notification = Color.fromRGBO(31, 41, 72, 1);
  static final Color text = Color.fromRGBO(80, 80, 80, 1);
  static final Color gray = Color.fromRGBO(172, 172, 172, 1);
  static final Color error = Color.fromRGBO(255, 87, 87, 1);
  static final Color transparent = Colors.transparent;

  // --bg: rgb(247, 247, 247);
  // --tetiary: rgb(22, 28, 48);
  // --accent: rgb(252, 185, 0);
  // --logo: rgb(255, 105, 0);

  static void routeTo(BuildContext context, Widget destination,
      {bool FullScreenDialog = false}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: FullScreenDialog,
        builder: (context) => destination,
      ),
    );
  }
}
