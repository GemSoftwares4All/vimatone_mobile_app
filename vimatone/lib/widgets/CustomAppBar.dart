import 'package:flutter/material.dart';
import 'package:vimatone/Core/Extras.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search_rounded),
        ),
        SizedBox(
          width: Extras.fontBody_sm,
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.shopping_cart_outlined),
        ),
        SizedBox(
          width: Extras.fontBody_sm,
        )
      ],
    );
  }

  static final _appbar = AppBar();
  @override
  Size get preferredSize => _appbar.preferredSize;
}
