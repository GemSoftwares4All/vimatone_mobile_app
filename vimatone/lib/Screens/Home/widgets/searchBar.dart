import 'package:flutter/material.dart';
import 'package:vimatone/Config/Extras.dart';

class Searchbar extends StatelessWidget {
  const Searchbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color_primary,
      padding: EdgeInsets.all(padding_md),
      child: TextFormField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: color_gray,
          ),
          label: Text(
            "Search",
            style: font_body_title.copyWith(color: color_gray),
          ),
          hintText: "Search...",
        ),
      ),
    );
  }
}
